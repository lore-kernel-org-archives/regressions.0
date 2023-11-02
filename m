Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F64B7498
	for <regressions@lists.linux.dev>; Thu,  2 Nov 2023 08:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSaMX+Bg"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-32faea0fa1fso118246f8f.1
        for <regressions@lists.linux.dev>; Thu, 02 Nov 2023 01:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698915011; x=1699519811; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BKF4AuwBxKpYd7Ly1Ezs8kH7+emBGdvuLRRIRObR8w8=;
        b=NSaMX+BgcJlLI0q7WTHIuGGXSxp/VaPJVWmJtndlWIVF7s/1PR6xgby/gR/0C8PBsq
         f0/j/Y/SrzXib1wCwa6naMCvJ7I9UwsorRjAlcCE8/qMVwxtvz9xpPVCF0QHT+zt37ni
         iAgGQJ1Fjn6uO1zxRy1i1VeoKwkrEOtB/upQE9p29uRY27YM89FP8S3S0rs5KMJu9l6h
         DDS8cbte5sQcPdQh19u4UvsS0L3rI4DwxTQm1Ho4gTCaXTHftL2wPCk6sK8Mp4b06sl9
         r1gENXhDP5gIDGpglJgdfTukmyG+jnTotVHSN8EV/nBD9G5sP58Dge791+guaNtivPT3
         qF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698915011; x=1699519811;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BKF4AuwBxKpYd7Ly1Ezs8kH7+emBGdvuLRRIRObR8w8=;
        b=PcjeSKYldDb82b+hWGga+UVxBJzqjK2oj3Bb6Ryry/YuHYGkRk1U8Dg9tTsiHipkUZ
         t2c3/XYkhSxTUDexTmoFXV1D1YLdpMWn6hWSC7kBHVexXhzRX5qy08JPklqXosE+1MVl
         uTlYDnZn0V8dV+okyxNcL8H/BlbNsMDqqRGY1XPot3deBeen/3jh+dBrXtoWTKd1Imyk
         hj4hAOt3JUnyZXOqcteaOG/px+Ytmmeqv59TDoNd2g18VjyXSWXmuPB/DTMbeZveJVT3
         sH1O+VO4vSiMhSGNKtTHCVbxEDx879uFySPDiDZ+FVRs3/HMwT9pVOAP962FWggp34De
         OTFQ==
X-Gm-Message-State: AOJu0YxStCwBM46IXUbpTxxcUwo9iunZyFSekQI20fo5VV2vZDg0yjd3
	olqBSceT2wpDch5hxGffeeo=
X-Google-Smtp-Source: AGHT+IFpPQcz2g4e80rRiQAB/q8Kh3kmpvmcK2UWFhQwt3wEtaM8jzxqzZ92RFRUnkmGnE3MC2eaiQ==
X-Received: by 2002:a05:6000:1565:b0:32d:8c67:be05 with SMTP id 5-20020a056000156500b0032d8c67be05mr9214808wrz.22.1698915011124;
        Thu, 02 Nov 2023 01:50:11 -0700 (PDT)
Received: from debian ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id n9-20020a5d4849000000b0032d8eecf901sm1844107wrs.3.2023.11.02.01.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 01:50:10 -0700 (PDT)
Date: Thu, 2 Nov 2023 08:50:08 +0000
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Chuyi Zhou <zhouchuyi@bytedance.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	regressions@lists.linux.dev,
	Yonghong Song <yonghong.song@linux.dev>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: mainline build failure due to 9c66dc94b62a ("bpf: Introduce css_task
 open-coded iterator kfuncs")
Message-ID: <ZUNiwMLBsL52X9wa@debian>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

The latest mainline kernel branch fails to build mips decstation_64_defconfig,
decstation_defconfig and decstation_r4k_defconfig with the error:

kernel/bpf/task_iter.c: In function 'bpf_iter_css_task_new':
kernel/bpf/task_iter.c:917:14: error: 'CSS_TASK_ITER_PROCS' undeclared (first use in this function)
  917 |         case CSS_TASK_ITER_PROCS | CSS_TASK_ITER_THREADED:
      |              ^~~~~~~~~~~~~~~~~~~
kernel/bpf/task_iter.c:917:14: note: each undeclared identifier is reported only once for each function it appears in
kernel/bpf/task_iter.c:917:36: error: 'CSS_TASK_ITER_THREADED' undeclared (first use in this function)
  917 |         case CSS_TASK_ITER_PROCS | CSS_TASK_ITER_THREADED:
      |                                    ^~~~~~~~~~~~~~~~~~~~~~
kernel/bpf/task_iter.c:925:60: error: invalid application of 'sizeof' to incomplete type 'struct css_task_iter'
  925 |         kit->css_it = bpf_mem_alloc(&bpf_global_ma, sizeof(struct css_task_iter));
      |                                                            ^~~~~~
kernel/bpf/task_iter.c:928:9: error: implicit declaration of function 'css_task_iter_start'; did you mean 'task_seq_start'? [-Werror=implicit-function-declaration]
  928 |         css_task_iter_start(css, flags, kit->css_it);
      |         ^~~~~~~~~~~~~~~~~~~
      |         task_seq_start
kernel/bpf/task_iter.c: In function 'bpf_iter_css_task_next':
kernel/bpf/task_iter.c:938:16: error: implicit declaration of function 'css_task_iter_next'; did you mean 'class_dev_iter_next'? [-Werror=implicit-function-declaration]
  938 |         return css_task_iter_next(kit->css_it);
      |                ^~~~~~~~~~~~~~~~~~
      |                class_dev_iter_next
kernel/bpf/task_iter.c:938:16: warning: returning 'int' from a function with return type 'struct task_struct *' makes pointer from integer without a cast [-Wint-conversion]
  938 |         return css_task_iter_next(kit->css_it);
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
kernel/bpf/task_iter.c: In function 'bpf_iter_css_task_destroy':
kernel/bpf/task_iter.c:947:9: error: implicit declaration of function 'css_task_iter_end' [-Werror=implicit-function-declaration]
  947 |         css_task_iter_end(kit->css_it);
      |         ^~~~~~~~~~~~~~~~~

git bisect pointed to 9c66dc94b62a ("bpf: Introduce css_task open-coded iterator kfuncs")

I will be happy to test any patch or provide any extra log if needed.

#regzbot introduced: 9c66dc94b62aef23300f05f63404afb8990920b4

-- 
Regards
Sudip
