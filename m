Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CEB33E373
	for <regressions@lists.linux.dev>; Thu, 22 Jan 2026 18:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769108362; cv=none; b=kzYmL8e9ZcKWzjh3j7KKkqdJNVBB9bSJAnN5aYMaZ2NVYgdb8vD49eyO/6Zc0VRweiSla5DlVTSMZi2xHDm3kcqz41kTApEfKgKi+csna/9KcOprpSWR3Ev+idJWjTlv8GuvhnkwKXKGRKeOQQoFa7fWwjvvlzqHaZIEGb9bFO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769108362; c=relaxed/simple;
	bh=4hu1g6v6fa86edOO4CtgsbDn0dI/VTmtx7rVd9sxHOk=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=PcXrfgay8sDWQk6/t9D6bKyY8OfLaR1ihN81Zg9eJyPeBUus4c41Zpdg0nXb4dG95U2InlIA300/J69XMCJArt4lz+g3qBjM7983q/IIg0Z7Oc6epTsq6SF2msYoIw1HjNEOXQiXUeAgVOIzACLzhEeIOfFkq31d3NtRO6mlgCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=YmKM6GC4; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="YmKM6GC4"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-12331482b8fso1256226c88.1
        for <regressions@lists.linux.dev>; Thu, 22 Jan 2026 10:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769108346; x=1769713146; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrIzk2/xJmwFk/zbADXcPOxmFVVXMdsJP8L/1g75haU=;
        b=YmKM6GC4sBNUhkavmMtUIDQc8LQQG7682VTTvnc2C7+b/C6w0ZYmn/a854GzttjQuM
         6AFqcIhwa8YIiYKRNroAC9l3MIZPGKY08E+znHbQIjZ13ynHWfMNBh67ECdlhX6UoH7t
         tWvDTjaTqg3f2SuKhDtot81I1aFpWlphRd6eKuEJTV9tzVE4rubd0hB+as1XmZcpHLs7
         njuTjgoNIrJS8vvIQ3LDBTLW7WaUZqDJg95rEX+dTugIUKn2vNrgfBLiZOnArB0xx3vE
         PmVcGULczHqpSjIEUBSSxh6RuzZOBBKfQ57wbdvFRYEPNHhDkf+l0XHGfARmxTh3rnZM
         Pdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769108346; x=1769713146;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hrIzk2/xJmwFk/zbADXcPOxmFVVXMdsJP8L/1g75haU=;
        b=hd7MvSyGaNQJR0W4q2uxNS0bJiGBfm7lXCxNb23kp0B06yIm3MrT/cJNZSDd3zqv0B
         4DXrZmEoNNnlaXQxw9PM8gEY+l1gmbvwnaBJjAdZMelgRh3p8DRj5D8/29OSqtJ+gWZG
         JItS0pqurgPDM32GTzKD+RwjVnywySmFMqwl8e6PdOsiCH9w6NdYGki1KEDGjTB2/F2D
         5gtv60+3f39Zy6HzEHdT63JaK0cejSIc718rjwe6Q41JHAysCYZ3PiWAym38GliY0tPO
         cJbW7QR1fd2RbG1czb3UpITK/nOQUVzFOGIPB1KWSE7Erc/Fsgy3oWxUv3ya2qSwra/H
         Zm8w==
X-Gm-Message-State: AOJu0YwOOgdhtYHv/LfjYGDJFlfH/4QgbX6Mh+CrAqIHdA9dy1i/+gvE
	vOq93QgKnbKXP3XXN3Cqm+ID74phEDepHFG5uJFxSwvpBAE3xDZCVc72Mm+nFskwDCQ=
X-Gm-Gg: AZuq6aIggvFLB55r3kqC5R6rcAElLnJEMnvQnNlgoN/yXMiuGpzwEYRdFaS94e1AXjJ
	3XgSVJB3vwRfzsW4bVgdj1yo47+TVGM+49tBixMIWOCjs9r/DQ4XcRUEgMAtclGR8XSVzytPsjk
	1fU/oxeMvCuk13w0PREwq1sSdIA7QQhzVw8mVsx1TaH4uttxETgOopdGJb5Lsj+pFi/owOglsN/
	5CCGVp28O1mDHO/zMcAQbBJ0zDaMOH07GhnD30BgBmhXJV73iBMLV0mLwfeeWOwW8xKYN6ga0ZM
	9Tm82J76dKsMYU1Y4LeMiZsTqJ54qOopIeJ9M0EeERMegwQoRl4eusZAzYXsqWLiWt5Dwmj45/X
	QaVxryM8GMOsRm/8TBJriIeYZkQEyOsuZB+K+hdfkYj83FtPuqo6ILQhJEXf/OZtZYrhKFMLxYC
	vvVUWN
X-Received: by 2002:a05:7022:e1d:b0:11b:9386:8260 with SMTP id a92af1059eb24-1247dc161d9mr172847c88.45.1769108345973;
        Thu, 22 Jan 2026 10:59:05 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90ce0dsm484390c88.4.2026.01.22.10.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 10:59:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build)
 ./include/trace/define_trace.h:118:42: fatal
 error: ./panthor_trac...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 22 Jan 2026 18:59:05 -0000
Message-ID: <176910834460.1005.16968493744924197735@22d5995788c3>





Hello,

New build issue found on next/master:

---
 ./include/trace/define_trace.h:118:42: fatal error: ./panthor_trace.h: No such file or directory in drivers/gpu/drm/panthor/panthor_gpu.o (drivers/gpu/drm/panthor/panthor_gpu.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:3b4c709e81fe466ab9d16c4b959dd04ed77493da
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
- tags: next-20260122

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
                 from drivers/gpu/drm/panthor/panthor_gpu.c:26:
./include/trace/define_trace.h:118:42: fatal error: ./panthor_trace.h: No such file or directory
  118 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
      |                                          ^
compilation terminated.

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+CONFIG_CPU_BIG_ENDIAN=y+debug+kselftest+tinyconfig on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-mainline-big_endian-697269601908a6300d90db79/.config
- dashboard: https://d.kernelci.org/build/maestro:697269601908a6300d90db79

## defconfig+arm64-chromebook+kcidebug+lab-setup on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-chromebook-kcidebug-697269581908a6300d90db73/.config
- dashboard: https://d.kernelci.org/build/maestro:697269581908a6300d90db73

## defconfig+lab-setup+kselftest on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-build-only-697269541908a6300d90db70/.config
- dashboard: https://d.kernelci.org/build/maestro:697269541908a6300d90db70

## defconfig+netdev+nfs-root-boot+kselftest on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-nfsboot-697269371908a6300d90db59/.config
- dashboard: https://d.kernelci.org/build/maestro:697269371908a6300d90db59


#kernelci issue maestro:3b4c709e81fe466ab9d16c4b959dd04ed77493da

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
