module.exports = function(plop) {
  plop.setGenerator('project', {
    description: 'Generate a new portfolio project',
    prompts: [
      { type: 'input', name: 'name', message: 'Project name (slug):' },
      { type: 'input', name: 'category', message: 'Category:' },
      { type: 'input', name: 'gigType', message: 'Gig type:' },
      { type: 'input', name: 'tech', message: 'Tech (python, node-ts, node-js):' },
      { type: 'input', name: 'description', message: 'Description:' }
    ],
    actions: function(data) {
      const actions = [];
      const tech = data.tech;

      if (tech === 'python') {
        actions.push({
          type: 'add',
          path: '{{path}}/src/main.py',
          templateFile: 'templates/python/src/main.py.hbs'
        });
        actions.push({
          type: 'add',
          path: '{{path}}/tests/test_main.py',
          templateFile: 'templates/python/tests/test_main.py.hbs'
        });
        actions.push({
          type: 'add',
          path: '{{path}}/pyproject.toml',
          templateFile: 'templates/python/pyproject.toml.hbs'
        });
      } else {
        actions.push({
          type: 'add',
          path: '{{path}}/src/index.ts',
          templateFile: 'templates/node-ts/src/index.ts.hbs'
        });
        actions.push({
          type: 'add',
          path: '{{path}}/tests/index.test.ts',
          templateFile: 'templates/node-ts/tests/index.test.ts.hbs'
        });
        actions.push({
          type: 'add',
          path: '{{path}}/package.json',
          templateFile: 'templates/node-ts/package.json.hbs'
        });
        actions.push({
          type: 'add',
          path: '{{path}}/vitest.config.ts',
          templateFile: 'templates/node-ts/vitest.config.ts.hbs'
        });
      }

      actions.push({
        type: 'add',
        path: '{{path}}/README.md',
        templateFile: 'templates/node-ts/README.md.hbs'
      });
      actions.push({
        type: 'add',
        path: '{{path}}/.github/workflows/ci.yml',
        templateFile: 'templates/node-ts/.github/workflows/ci.yml.hbs'
      });
      actions.push({
        type: 'add',
        path: '{{path}}/CLAUDE.md',
        templateFile: 'templates/node-ts/CLAUDE.md.hbs'
      });

      return actions;
    }
  });
};
