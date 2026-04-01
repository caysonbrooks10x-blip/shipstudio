export interface ProjectConfig {
  name: string;
  category: string;
  gigType: string;
  tech: 'python' | 'node-ts' | 'node-js';
  description: string;
  path: string;
}

export type Category = 'ai-ml' | 'cybersecurity' | 'software-dev' | 'digital-marketing' | 'copywriting' | 'ui-ux' | 'consulting' | 'data-analytics' | 'video-editing' | 'operations';

export const CATEGORIES: Category[] = ['ai-ml', 'cybersecurity', 'software-dev', 'digital-marketing', 'copywriting', 'ui-ux', 'consulting', 'data-analytics', 'video-editing', 'operations'];
