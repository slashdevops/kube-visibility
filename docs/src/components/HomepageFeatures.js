import React from 'react';
import clsx from 'clsx';
import styles from './HomepageFeatures.module.css';

const FeatureList = [
  {
    title: 'Simplicity',
    Svg: require('../../static/img/undraw_docusaurus_mountain.svg').default,
    description: (
      <>
        This project was inspired by kube-prometheus bundle but instead of use jsonnet to customize and configure it, this use kustomize to overlay Kubernetes manifests and kpt to distribute it as a package.
      </>
    ),
  },
  {
    title: 'GitOps Friendly',
    Svg: require('../../static/img/undraw_docusaurus_tree.svg').default,
    description: (
      <>
        Being built with simplicty in mind the layered modularity of Kube-Visibility has been designed through the use of kustomize and kpt.
      </>
    ),
  },
  {
    title: 'Monitoring at Scale',
    Svg: require('../../static/img/undraw_docusaurus_react.svg').default,
    description: (
      <>
        Kube-Visibility is a production ready kustomize deployment that allows cluster operators to easily manage and avoid the complexity and limitations of the Prometheus Operator official HELM chart.
      </>
    ),
  },
];

function Feature({Svg, title, description}) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
        <Svg className={styles.featureSvg} alt={title} />
      </div>
      <div className="text--center padding-horiz--md">
        <h3>{title}</h3>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures() {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
