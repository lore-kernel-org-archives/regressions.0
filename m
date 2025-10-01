Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEEE266B65
	for <regressions@lists.linux.dev>; Wed,  1 Oct 2025 03:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759291148; cv=none; b=qR8sPeFZiondXU7JT/b8A7O9dMuQUgrlYVGQC1T4pIGVtLUpsIf91jLr56IfGZfcUnysgf15nDiviMnQwVq/kq12N2ndo1GTb4qdVbsQ1it+syquKDbVPok67aiNCRsoTE6UlVU5Zvov1b/Qu2kc+FzbdQErfNwRxPzgqx6mDEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759291148; c=relaxed/simple;
	bh=Rl5Xadtor1PTfyr/gyhQZTB9+PlfN+xdMlhi57St+JM=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=DM2j9J4rrck7S4AxwcZ7PiF36Ddb8l72ERuaAvm+FQgEaI/8hMbocOr7NTtyFBTZLQ9RO/H8KpVgqDFO0LGR1Sl8z5EwA/7TXc0z1EzwJGBfCLm15RDOwn8T92+hld1GdyDFAj+7Jy6we8cDTEvQ1FCcak1Ng24FalMRVCq3p14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ZGGJeu1o; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ZGGJeu1o"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3306d3ab2e4so7579108a91.3
        for <regressions@lists.linux.dev>; Tue, 30 Sep 2025 20:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1759291146; x=1759895946; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfwxcOZy//fHUKHkLLnQ3TPRM9+rtW/noMD58akZIu8=;
        b=ZGGJeu1oMPOMtEUorJXW/wR8cwOSqFsbz7kfEVmLjhzrFaDeqFaS4PSqEreCQ/CWEb
         jHU4iiWhlGbCvzGnyJDLNqK8zAJ221vOPm3clreE+FyL8zZWpGDtOnhG9m5zHHUksvyf
         /3y3awf3Pb7heW/6Vn2hNpg+ljORZO3j/rfIu+pKjMAJo+QmccvgA5B8MBIsnCv281tR
         Wv6PzA8/zkhYi+7IJd9NevQToipoME4kJo/x3u82pYCuYYelYyfgpNkOvAq0Nm1G4tNs
         QjLAiNbpZYol4ZjtMTHycKjYoM7W3fCad+V2X/ahXwZ8328+Fl9mNv5alih80e82sM6p
         xOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759291146; x=1759895946;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mfwxcOZy//fHUKHkLLnQ3TPRM9+rtW/noMD58akZIu8=;
        b=grKwj8ykG0szx08cKoYoEXShLfW3naFW9VtklVxl/ZCJXT31GUuHi6d2e0nJoMFb9m
         yYaCX4Sg9UjVQJzfn5K+PS0JB7BH4aF8R+NOY8ybyb/40We/fIQIU6ighvNc/JRzqJ9B
         4AXo+98KEceNWkRq4sRdw7vn5E/ImI4gjQfXyH+yuBOlMSGgv/lwjS1gPJ+b2FuDYUHK
         qbafME9XJTA08YeOvhnFdeDtEFXmDGpX5BBZ6uzFrFCvcmRyDRS7T7VATZyX8vpP0MHf
         G1EvXgGk69rZRCZB64TbH1O6Vsag0QWY0dLJTKYuvGyGNA6QRWr0OWfvU+XF1gQxTeLw
         u9NQ==
X-Gm-Message-State: AOJu0Yw1zah5loKoMoqfOUZCoBLZT00eVAMZEUewg3HxVeGX9uVCkYmW
	PbTqqBQnVRQ+y/VI87Tt47lpRcPvS4gJyQzV/Xk1TE+cr0JaNWEny131X5q2J/gL/48=
X-Gm-Gg: ASbGncvl5eFiE8R3VOu4icbFFYll/+ExaeuovcdzduV7LJ9QgNt7CqqUdizPvaOEcO7
	Eqd1/+0GqIGR6u0nA5qp9lzezVnOLBCGKYGRhEjW5gid3N7coXjUAgij+Qd2skdNxQQ9lbBydvV
	ry+s6rVbpSfl4DtSLRJBBfSpegUyJbU2Clwl4uEO6NmrsMk0vfKSC67vQhLYkO26ubz7NSPGgZB
	Se2DaIKKxtZ4xzrw31SIBlMbgktBkd89EIyG3mBuF1C+4PTEMvU5zWTofUjsO4A23dH9Qaq/IKM
	7EtdQQuRu4U/2ygG+QOKs7yFhPEo+T44RwAJVwSTqb4YkwY7JZqo0sYXaoJ9eY7PVPuntTy0Elr
	40gvehhlO0le5JPhtPORTpX9UjL35AVQLEUUpRgXG
X-Google-Smtp-Source: AGHT+IF/izwIB48okD3rcBgnhMg6w428/kyHkc1QSU0nGRnWpmEfNo3liMCL0WHccc4Dvkhkts9lWw==
X-Received: by 2002:a17:90b:1a91:b0:32e:1b1c:f8b8 with SMTP id 98e67ed59e1d1-339a6f58396mr2056030a91.26.1759291146011;
        Tue, 30 Sep 2025 20:59:06 -0700 (PDT)
Received: from 1e895cdadf47 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6f20e8asm1095363a91.22.2025.09.30.20.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 20:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) ../../kselftest.h:108:8: error:
 unknown
 type name 'bool' in /tmp/k...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 01 Oct 2025 03:59:04 -0000
Message-ID: <175929114406.805.6273664112668437721@1e895cdadf47>





Hello,

New build issue found on mainline/master:

---
 ../../kselftest.h:108:8: error: unknown type name 'bool' in /tmp/kci/linux/tools/testing/selftests/arm64/fp/za-fork (/tmp/kci/linux/tools/testing/selftests/arm64/fp/za-fork.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:0c1b99f5ae52b9d098e7282cd69875d2632a3337
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  4b81e2eb9e4db8f6094c077d0c8b27c264901c1b



Log excerpt:
=====================================================
	-static -ffreestanding -Wall za-fork.c /tmp/kci/linux/tools/testing/selftests/arm64/fp/za-fork-asm.o -o /tmp/kci/linux/tools/testing/selftests/arm64/fp/za-fork
In file included from za-fork.c:12:
../../kselftest.h:108:8: error: unknown type name 'bool'
  108 | static bool ksft_debug_enabled;
      |        ^
1 error generated.

=====================================================


# Builds where the incident occurred:

## defconfig+allmodconfig on (arm64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:68dc7b96841b167e8d370e93


#kernelci issue maestro:0c1b99f5ae52b9d098e7282cd69875d2632a3337

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
