Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCE226980F
	for <regressions@lists.linux.dev>; Thu, 22 Jan 2026 19:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769111947; cv=none; b=NCCbxl5a6R4pYHnGf4VfCybILb3rbvt8RYY1xgFVC8BsR/v9YEmEz0Dy++JQfgAHWxJ0O4v4CIDnnX4zLEMfOIF3goIzZX7OCoqUy7k1vLqi9MCNt52URJRPFV1sBEJndEFt+shxyljcaxSno/mYZEaW763GGiYhctp4T5BwO3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769111947; c=relaxed/simple;
	bh=2t8E3MkhKABmyAjVd0Ef3V6oirxpLfRfIzmzGHTHGGQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=nple0Ifo5ubwVTCeM0Wri+TQBsi5COVh8/8kbmXOVMWQCf8nK67+Az4kPytY9ViP2pxSyEF8ge4tX4d44ubZ7pQbirgjdoLpbjZSLDXYpQMRXp/Ax6cfXe0BVJB6AhdIfuOYm8Ann1M8eQ13+2qzriyKb9qXPZRcmKYRTtbqhUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=YI/BC6c0; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="YI/BC6c0"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-1233702afd3so2209280c88.0
        for <regressions@lists.linux.dev>; Thu, 22 Jan 2026 11:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769111945; x=1769716745; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KU9C5wBf3Lxzx7WFsDTDEcyUVyGJTPYy46OajzXqiaE=;
        b=YI/BC6c0/QuKhdWA9A3hAM4TvqHzTUcaZWxXfi7Nk1ezdKWvKQm2DkrdXRTSTTm2Px
         2jk3k4k3s1W85KTozQUn723M3rfG3Zdgib7GuqBY6E5AvuQg3+8gPOgKdqT5m9E2qRQI
         Et/W3bMNF5FmDH4WLuFvvOqz9eZ/NO5V7WVyY9lobI6Flx9Zt74fTXJ3O4X23k+T999C
         ufnEXXa4ERlYFczw9yAY4lQP6bpxII8JqiXfHfNO8Z/c/LDeHozmlHH6zNiQXenkny0+
         CkIMtFSb0HxQYEqyBg0rgkOD/bOsR6uI7utCjsSSQxbSmPgwSgY1AMjK7nHEePdxqDDb
         OIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769111945; x=1769716745;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KU9C5wBf3Lxzx7WFsDTDEcyUVyGJTPYy46OajzXqiaE=;
        b=PN6Hz+nEsDZQYjXbuNweRZD6wAWKza7OJlRFbFLGblErRGzwxsYp8nXeoCWZULTWdo
         uGuBqD7XpD208mLHonqGH5DO2KODYLe249FTttP4lGkaHdfxlSkOluV2lAbGzpx1t6aK
         GTOKoK1XfggUat48CsFV1+UKpeOqmylgGL8FE5pvO9PcqZ/vzdZXyGXmQDypt4P5//gD
         G8mGVDZpfEAub2hFxZgxmdxIN+TnB8HY1yVCUU9yCHxyMHALZyRfH3I6dIkCtbToX0nd
         h3B4Ic0VCSjUbk6rK49lcsmjWj2L8Jo7zVo3TczXVQc4kj2QZ7b0BmdpSIBcNdsbmgDN
         KLaA==
X-Gm-Message-State: AOJu0Yw1kJihHT/+DB6ZbaiQ4hFDPbGSiFejNnq/rwzmdWuGdQpcqrnL
	g29N6h9l1uOTW92y/IE7KAbUjHmU9+W7L8qLPBToVGQXmYJcVkTUe7gp8PB4bAbd6vY=
X-Gm-Gg: AZuq6aL14Nt6hy4lRHuFWLzYLhWfVUxh4+pErXelXBoR+n8gse99uM06k9uvq9EEikn
	43E7urF1ztWGtBW1Z56EUIOsz/CjUI7/tgPnSd4a4eZQvGZCxToWr25IiYKyb2zIKa6eKjn8nfX
	sCzIpWpxuXm+dV+B+rw8vnb72GeZ2HDSqwsIhwqDrVJlJMH//7iuPVwnMsTLSA1Vwats5o2JEmE
	OvEmz0cXBqKQerhNuzJ1SPuFe91J4OM5iOYbWX0FbrSTrDW8hzRQGWcXkIsU8YgzUDhy2zBDji+
	64nfM8Xmff4pioqlJSlzjuQK2+zkiBKMRLG3l9vygqlKx4661XthRCvZ+GsQGeljvcAimaoIUpL
	X7CkmqaEwVq6djx65FH9LxPOqRmZRoF9c+avw+J0bYw28snfkXHezOni1yStOLXUWWWNXUjIPR+
	DXsTD6
X-Received: by 2002:a05:7022:e10:b0:119:e55a:9beb with SMTP id a92af1059eb24-1247dbae7e6mr245500c88.7.1769111944983;
        Thu, 22 Jan 2026 11:59:04 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d9a4275sm760985c88.15.2026.01.22.11.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 11:59:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build)
 ./include/trace/define_trace.h:118:10: fatal
 error: './panthor_tra...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 22 Jan 2026 19:59:04 -0000
Message-ID: <176911194369.1024.8592198532505888506@22d5995788c3>





Hello,

New build issue found on next/master:

---
 ./include/trace/define_trace.h:118:10: fatal error: './panthor_trace.h' file not found in drivers/gpu/drm/panthor/panthor_gpu.o (drivers/gpu/drm/panthor/panthor_gpu.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:cd7b672e9f4a4e1686f0e661f2aedae6b9039e06
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
- tags: next-20260122

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
In file included from drivers/gpu/drm/panthor/panthor_gpu.c:26:
In file included from drivers/gpu/drm/panthor/panthor_trace.h:86:
./include/trace/define_trace.h:118:10: fatal error: './panthor_trace.h' file not found
  118 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/trace/define_trace.h:113:32: note: expanded from macro 'TRACE_INCLUDE'
  113 | # define TRACE_INCLUDE(system) __TRACE_INCLUDE(system)
      |                                ^~~~~~~~~~~~~~~~~~~~~~~
./include/trace/define_trace.h:110:34: note: expanded from macro '__TRACE_INCLUDE'
  110 | # define __TRACE_INCLUDE(system) __stringify(TRACE_INCLUDE_PATH/system.h)
      |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
   10 | #define __stringify(x...)       __stringify_1(x)
      |                                 ^~~~~~~~~~~~~~~~
./include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
    9 | #define __stringify_1(x...)     #x
      |                                 ^~
<scratch space>:63:1: note: expanded from here
   63 | "./panthor_trace.h"
      | ^~~~~~~~~~~~~~~~~~~
1 error generated.

=====================================================


# Builds where the incident occurred:

## defconfig on (arm64):
- compiler: clang-21
- config: https://files.kernelci.org/kbuild-clang-21-arm64-mainline-697268df1908a6300d90db15/.config
- dashboard: https://d.kernelci.org/build/maestro:697268df1908a6300d90db15


#kernelci issue maestro:cd7b672e9f4a4e1686f0e661f2aedae6b9039e06

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
