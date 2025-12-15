Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B12A29ACF6
	for <regressions@lists.linux.dev>; Mon, 15 Dec 2025 23:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765843147; cv=none; b=seKuD/cAxHEftezCH8re6MfQh2OnIRHi9+hfHwIFRAeuVh8GlANmueyGLnYRv9kZmQgivBLymSJNVmoQsv4JZNh+iBsAzMJqIjBdZe5o4PYFnWvxabrrVSVCk17Iy3KvKGQpHjbdQ9itUWu30hmEibNd8wBcfLWJYSIMHCHodow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765843147; c=relaxed/simple;
	bh=aUUqaYm/em1vfd4H8MXlLWDsJWRcYiIvgnLSp4zmUgg=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=IUrXMVaoFYkap/vRg61fT9V/PwYAYVXhfGTTGa5nlF22b7uYZc+u+GqFMnIa5gBJzXFgd9qqeBy+UPKWVZ9nsGTRV1hjbbzclg3ceHEh9yFA0R6jtnl6D1IFI1YQq0RcMp6SHARJ3DfdD43yG02tn6BPDp0OZsjA6/ZT/ErvQUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=uiTRAGCE; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="uiTRAGCE"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-bc0d7255434so2604270a12.0
        for <regressions@lists.linux.dev>; Mon, 15 Dec 2025 15:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1765843145; x=1766447945; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhJoYwe/PCXYwVu0tT+tOeoeCxiWwbIjyVtrV3UZN5A=;
        b=uiTRAGCEmNKtWg/8+j+4BSazOEGnrDBquMMA+1hOCkzyoeLJGWRMd6WNpMeJOixn77
         OBTsPuEE1Dm0HamSletLkrx9hmwkwn1NjbrOQ2gS02+zB2yyVSG7quTVjk8zSbD/aWxZ
         XaH7lSzsnHjYMrpNY4e97tYg3FJEbflyBXHnrfsE7Bm+5SWQrbt1bhNdyfh+hBGGkXQp
         SPVc0Bld2ZFn5x6byil4o94Hw4ytX42D54xyHu0EDRh+AYIvHeEqZAwLFKTTcH2oXIPI
         7NFmeL3isViUySLU7K/8i1GOCVDNI2UbQWJLRa85pp+FpRELOywvqWbN8DvswD3Bq4Jm
         RCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765843145; x=1766447945;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XhJoYwe/PCXYwVu0tT+tOeoeCxiWwbIjyVtrV3UZN5A=;
        b=D1Bc/zNYLNDkSkNpABAJa95FIY1d1W4kIFEAypK3hi0IhE6o/Xkz+C/HJw83mou/QN
         76RuI28RwCHOJmQJ0yfCj1if9rlncSRUYmiMI6sndcT5vpGPCAD0hAzc8OxV6y+cStsA
         zbtfuoXmYmiDOITtXjPXdmxL51oc3UAwKGwXQRmKkfk2Cc/H/iJbkLqNEIpBdZakzviO
         nlsK2oomCvrHW2n72KAwbRoKZBpKY95yZx2k6tkgy4I3sJYePXEGbh8p09MYNTFUBXFa
         7Ydi4ctf1gua16i3Y4vmKdynkm8EUmcSDQRSDSdXF0qLQjZ3rPm1YMg9nhyECP/5TiVd
         AZ0A==
X-Gm-Message-State: AOJu0Yy3w8QahR98PrbDsPsv70TMJyUVk4oc/JY/OkNaF/Vh6xrd61kh
	yvrIL9bPiSeks3cQ5qsPZrzyVwV9LuSrfxHlIt23HRYRTxmz/50/bv2HOyqFCAOV1bc=
X-Gm-Gg: AY/fxX4l4pvp9utpOsWDNxBfcERZ3wj9AFz+PFz4luwwZbVcZP61DWxP3cq+Dkrawu9
	Pju6Lu2wBDC38iWen4cxeMlF+KR4zkNiraOrQyunEiTkGlbScsjo/TWLdqixx7B8gYWcXrFFBLK
	WGG/gBJppVKnBYFaktCxx57An1fnvNFDpXYLOzLSTxl34YicHGlqaW5TaVO5eki38Y+p2OU849K
	R0ttBVirhvKH2+55CJGHjQU8tRpVWLrdMmHjUedFzq7M0db1Q0PFEBdsZxYWGqKNDLA6x7JUDyW
	TRzL0dCx0JSxba6KUzYciJjE0LRAxzY/BDyiG6Fa6AJ8bA+WH/BkevWbeeTq81We/N1Kr2Zkc7G
	/eNJICTAiA59NScHPc5Q/l0wWtJ44/gGMlD4b4MT3iiPiHPS1sEzrqvI9hXDSUXEs1aSDIxCMKN
	oHzpgY
X-Google-Smtp-Source: AGHT+IEqhN1ubWSuDskzmKUIzAWT6acagrsS0UulZfFDX0DFIKjAjc0DJL4MefNQrAh+wtGqeexThg==
X-Received: by 2002:a05:7300:cd86:b0:2a4:3593:468a with SMTP id 5a478bee46e88-2ac303f26a3mr8104130eec.38.1765843145335;
        Mon, 15 Dec 2025 15:59:05 -0800 (PST)
Received: from 77bfb67944a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ae4f05463dsm63520eec.32.2025.12.15.15.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 15:59:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/pending-fixes: (build) error: unknown warning
 option
 '-Wno-suggest-attribute=format'; did...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 15 Dec 2025 23:59:04 -0000
Message-ID: <176584314421.2550.17138936004167130394@77bfb67944a2>





Hello,

New build issue found on next/pending-fixes:

---
 error: unknown warning option '-Wno-suggest-attribute=format'; did you mean '-Wno-property-attribute-mismatch'? [-Werror,-Wunknown-warning-option] in kernel/trace/bpf_trace.o (scripts/Makefile.build:287) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:5264eacd00c08c60a249ef82374e5e5418baeed5
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  326785a1dd4cea4065390fb99b0249781c9912bf


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
  CC      kernel/trace/bpf_trace.o
error: unknown warning option '-Wno-suggest-attribute=format'; did you mean '-Wno-property-attribute-mismatch'? [-Werror,-Wunknown-warning-option]

=====================================================


# Builds where the incident occurred:

## aspeed_g5_defconfig on (arm):
- compiler: clang-21
- config: https://files.kernelci.org/kbuild-clang-21-arm-mainline-aspeed_g5-694097e2cbfd84c3cdba2939/.config
- dashboard: https://d.kernelci.org/build/maestro:694097e2cbfd84c3cdba2939


#kernelci issue maestro:5264eacd00c08c60a249ef82374e5e5418baeed5

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
