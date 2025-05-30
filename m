Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994E210F1
	for <regressions@lists.linux.dev>; Fri, 30 May 2025 06:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748586225; cv=none; b=Irfvz1K+PtOH2gIA2dB6AiABJia8EOirb8Y2noCENihUd1Rn9iDVfQQHHPZzOSHeTQlfPFGCo52jVShDXPtzk0XhDwE5buv7FWfWXHX9b+Jmu7xyxiic8yvjgFmRoll8TuumgYctrVPK5qJIzPI35jemN+wxTS7p0UA7N+tiEoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748586225; c=relaxed/simple;
	bh=Xb7mdOJmMCoE0+k4jfyHItFF+9//Z8CaPB7GH4gmWt0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=sDbZvPrdfRFLLRJUxuPHy8TxsADaIPd4G0rqzmVGZpxrdtIWv1loEhd3SU2sQyi0taKVo2X35ccXguDJeugYcDz6du9IhqYUtgV+ltT7Hvz9Dbeq+qlz8xGe9fbhJRq7FjTPuaTM+2k5meplkxLyLFzBpUKRAF38gkUWy5+NS4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5lRwYrp; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5lRwYrp"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-742af84818cso1101934b3a.1
        for <regressions@lists.linux.dev>; Thu, 29 May 2025 23:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748586223; x=1749191023; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XU1ATbyx3zqhkNtOJwdB4Idf67/DTZuYgGH9y5w9ob0=;
        b=G5lRwYrpD7a0TbXvw5Ct+eGaUs+Lwzu+aAeeyOqgczVVaZzyXJUW+Sgzp7f54h/X3J
         PgYA0HT6Oa8XOC05zU4laPK6YD1Bqtlpyw56aJf40iMGthP7ypNny1y4wIptwdPuDi9U
         MLeTioa9Ah0MzCqDf33pNf0HLtFoxlrzqWsEhZPHiuoZhSiI5hx+yNj8kAxVVtj/rnwo
         8ESXOcxax5CUGVgK+0UcNK8UhYLJV/ArKTBeTOZtxtwqgof1MkyV1RTy3Hym4sZP8lFu
         F0MF0umsGa32ySnp6MxbALxIuuV1CxFKAPcz7K+5xkgQ1Cr74ToVZwpOt1QfPiUHDdS5
         iPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748586223; x=1749191023;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XU1ATbyx3zqhkNtOJwdB4Idf67/DTZuYgGH9y5w9ob0=;
        b=UcL5YFU8F0dZmgavTK80BT/pO477OKFFFKlSnRTK+kWwYdr77Pu6LBvU6r6j750H4S
         zdN4KM4fdin9TXqU3p5Wej6hJWqHZqBjIJTr81/KdKFKXJwz1pFniAweYfSP5rxKnyTF
         gMVejEFY9345kaRgKXAsd69ggWyAQIFovuCoeRBHpHI0Z7fcpnJSg/nZNL5FDrqJnH0I
         jg0O7wiaxyKgRfLLJ5bvPACzCnvNqLYxe69hbr6ce/hK3Qm9J/nn3SIJ7dSQG1A8QbJ6
         l5dA8A8pTmGJfCOG3rT9ZqAFPwuJCIVYd9QhcwGcYku9Z8zlWDvrXRi9k9EYS3INpPhG
         xhSw==
X-Forwarded-Encrypted: i=1; AJvYcCVPThjNDGrQ9QJQFsKzAbnm9SZp7WQAgl2LyFaQ2qhRmyq0P9o1BgLQ0ByVvsuYLZ4APq4jJYR/+r60Lw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwI8a6cpx3ao/AWWFaV7v2DP6LmvTGhrMeJ96OCfKeGUU7TK/Sb
	bV9jgnHZnkSJuqJa//7ttRhog7ACKany/NeTrcvNITwBD4Q+nQ4Uncga
X-Gm-Gg: ASbGncsVCHtxDO2Txlb/mNcK+KYiqHokLQcvDjoafvSiey3QLSnCAVip9UHlZR5s52T
	TvA7hlT7I3WNhQ2OUSfD5Vs9uSGUC2SJoHUCPKM+OrCerQs1QDu+y5ueTs+CB/ZZxzpzoGZ3STL
	Lxg0vr/5tQ114zCCLhinW+ZyTrTgNmpUbCddOBTSNnmM7UTzxcmPbwJd7JcaQorD1BCOF93uhBw
	WqX6rWO50QyQZvC1GfT3Aqa6vyzB7fNkS1J9wIYfhiqH73OZQ/MRe1bA7NZvGQZMS49LLkli7rV
	olphiqdKuYbFakcNac04dDiqb8jsjTVoPWAIkHsBsOGrczlz9YrqsFTFBoB4DUw+JPpQE48LTbU
	2prOtv6iECD2J3AJ6gpyAdrHvMMgwZ4kOqJJ5ggaa
X-Google-Smtp-Source: AGHT+IGgZFZ2UAuM/Zo0NxdX1vCwI/rMCNH7OIrnsoOOrDtg1WcaON3WqkyWyPXqylK6ZrTXxUpkiQ==
X-Received: by 2002:a05:6a00:3c85:b0:73d:fefb:325 with SMTP id d2e1a72fcca58-747bd954c2bmr2878868b3a.5.1748586222598;
        Thu, 29 May 2025 23:23:42 -0700 (PDT)
Received: from [192.168.68.61] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affcf4c5sm2318757b3a.124.2025.05.29.23.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 23:23:42 -0700 (PDT)
Message-ID: <700ebe13-c2d3-48e3-800f-8dc327efb6fc@gmail.com>
Date: Thu, 29 May 2025 23:23:41 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-kernel@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
From: Rudraksha Gupta <guptarud@gmail.com>
Subject: REGRESSION: armv7 build mismatched types
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Logs: https://gitlab.postmarketos.org/LogicalErzor/pmaports/-/jobs/1368490

Archive: 
https://web.archive.org/web/20250530060232/https://gitlab.postmarketos.org/LogicalErzor/pmaports/-/jobs/1368490/raw


Snip:

||

|EXPORTS rust/exports_core_generated.h|
|
||
RUSTC L rust/compiler_builtins.o
||
RUSTC L rust/ffi.o
||
RUSTC L rust/build_error.o
||
RUSTC L rust/pin_init.o
||
RUSTC L rust/bindings.o
||
RUSTC L rust/uapi.o
||
EXPORTS rust/exports_bindings_generated.h
||
RUSTC L rust/kernel.o
||
error[E0308]: mismatched types
||
--> rust/kernel/lib.rs:234:45
||
|
||
234 | $crate::assert_same_type(field_ptr, (&raw const 
(*container_ptr).$($fields)*).cast_mut());
||
| ------------------------ --------- 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*const 
drm_device`, found `*mut Opaque<drm_device>`
||
| | |
||
| | expected all arguments to be this `*const drm_device` type because 
they need to match the type of this parameter
||
| arguments to this function are incorrect
||
|
||
::: rust/kernel/drm/device.rs:140:18
||
|
||
140 | unsafe { crate::container_of!(ptr, Self, dev) }.cast_mut()
||
| ------------------------------------ in this macro invocation
||
|
||
= note: expected raw pointer `*const drm_device`
||
found raw pointer `*mut Opaque<drm_device>`
||
note: function defined here
||
--> rust/kernel/lib.rs:241:8
||
|
||
241 | pub fn assert_same_type<T>(_: T, _: T) {}
||
| ^^^^^^^^^^^^^^^^ - ---- ---- this parameter needs to match the `*const 
drm_device` type of parameter #1
||
| | |
||
| | parameter #2 needs to match the `*const drm_device` type of this 
parameter
||
| parameter #1 and parameter #2 both reference this parameter `T`
||
= note: this error originates in the macro `crate::container_of` (in 
Nightly builds, run with -Z macro-backtrace for more info)
||
error[E0308]: mismatched types
||
--> rust/kernel/lib.rs:234:45
||
|
||
234 | $crate::assert_same_type(field_ptr, (&raw const 
(*container_ptr).$($fields)*).cast_mut());
||
| ------------------------ --------- 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*mut 
drm_gem_object`, found `*mut Opaque<drm_gem_object>`
||
| | |
||
| | expected all arguments to be this `*mut drm_gem_object` type because 
they need to match the type of this parameter
||
| arguments to this function are incorrect
||
|
||
::: rust/kernel/drm/gem/mod.rs:130:20
||
|
||
130 | unsafe { &*crate::container_of!(self_ptr, Object<T>, obj) }
||
| ---------------------------------------------- in this macro invocation
||
|
||
= note: expected raw pointer `*mut drm_gem_object`
||
found raw pointer `*mut Opaque<drm_gem_object>`
||
note: function defined here
||
--> rust/kernel/lib.rs:241:8
||
|
||
241 | pub fn assert_same_type<T>(_: T, _: T) {}
||
| ^^^^^^^^^^^^^^^^ - ---- ---- this parameter needs to match the `*mut 
drm_gem_object` type of parameter #1
||
| | |
||
| | parameter #2 needs to match the `*mut drm_gem_object` type of this 
parameter
||
| parameter #1 and parameter #2 both reference this parameter `T`
||
= note: this error originates in the macro `crate::container_of` (in 
Nightly builds, run with -Z macro-backtrace for more info)
||
error[E0308]: mismatched types
||
--> rust/kernel/lib.rs:234:45
||
|
||
234 | $crate::assert_same_type(field_ptr, (&raw const 
(*container_ptr).$($fields)*).cast_mut());
||
| ------------------------ --------- 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*mut 
drm_gem_object`, found `*mut Opaque<drm_gem_object>`
||
| | |
||
| | expected all arguments to be this `*mut drm_gem_object` type because 
they need to match the type of this parameter
||
| arguments to this function are incorrect
||
|
||
::: rust/kernel/drm/gem/mod.rs:273:29
||
|
||
273 | let this = unsafe { crate::container_of!(obj, Self, obj) };
||
| ------------------------------------ in this macro invocation
||
|
||
= note: expected raw pointer `*mut drm_gem_object`
||
found raw pointer `*mut Opaque<drm_gem_object>`
||
note: function defined here
||
--> rust/kernel/lib.rs:241:8
||
|
||
241 | pub fn assert_same_type<T>(_: T, _: T) {}
||
| ^^^^^^^^^^^^^^^^ - ---- ---- this parameter needs to match the `*mut 
drm_gem_object` type of parameter #1
||
| | |
||
| | parameter #2 needs to match the `*mut drm_gem_object` type of this 
parameter
||
| parameter #1 and parameter #2 both reference this parameter `T`
||
= note: this error originates in the macro `crate::container_of` (in 
Nightly builds, run with -Z macro-backtrace for more info)
||
error: aborting due to 3 previous errors
||
For more information about this error, try `rustc --explain E0308`.
||
make[2]: *** [rust/Makefile:538: rust/kernel.o] Error 1
||
make[1]: *** 
[/home/pmos/build/src/linux-next-next-20250530/Makefile:1285: prepare] 
Error 2
||make: *** [Makefile:248: __sub-make] Error 2|


Bad: next-20250530

Good: next-20250528


Likely introduced with: 
https://lore.kernel.org/all/CANiq72mFiCrzawVUVOU2giJtBVsRdAO3sGtDsZptPuFvmid3EQ@mail.gmail.com/


Repo: 
https://gitlab.postmarketos.org/LogicalErzor/pmaports/-/tree/rust/device/testing/linux-next

How it's built (Alpine-like build system):

- https://archive.ph/vxEmk

Config fragments (in addition to qcom_defconfig):

- https://archive.ph/q4hfc

- https://archive.ph/RKgFf

