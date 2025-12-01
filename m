Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC6F4C79
	for <regressions@lists.linux.dev>; Mon,  1 Dec 2025 04:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764565147; cv=none; b=nzZyR0hUddko92I8aMcCmFjwaNQMtLKv6Iv3mhI8Od97n/L12SJl3S97w7EhBO/xcPio/3T3SGHzkO2BoABI35o8/vjLQY2YPZ7i9Li50kRWryU0OVXWhkLQJzp5mWdiMeTwSEWXUDi8rhhPs4o3IWcTfKRpsxXFatFiKd+uO2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764565147; c=relaxed/simple;
	bh=+EIwlpBUqsyYbLwByq9NCXfVAaiAP0qKb8xqjgpZl4U=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=O8wUsYM4eATEU8tfdAcnTaNBLXixRlEKQ+VG3cAubaaljcaNb42MkY50uHf2Pq//C/STM0J0lDUL+aU0nVlW4TfhYLp8LWponMQ5NFWzGwwJg1BIG0TuHLMfNBrg7WLaOtd8SFTBi6mf5Bzfvj4eloT57fuagZUBoh6acapUKrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=v3Ehb1+o; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="v3Ehb1+o"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-bc8198fbaf8so3312166a12.1
        for <regressions@lists.linux.dev>; Sun, 30 Nov 2025 20:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1764565145; x=1765169945; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pAnWnIu5S46aH9KnsXkcZMO4/jxhslu/gl8KYWhSqM=;
        b=v3Ehb1+o7R3cS9c9PDUtofh6INAPnD7WWkQhmzezZNSylOLMVvet10HaUiS7J5DirB
         SC9fG92q0MGjnvbttSDoS2qfwJ3yFmuFK2l9/CK2lE3wjWieUqUDgF0eEyd4TTzCVR0p
         35nGlJ9OQkzFBorqz4YqdwB8w4s3hpf926jyDFH5E5qSP8v68eYG30Dk1xFSZE2WG4u/
         u46DW5vbvuqbiEJzM2qSxt/yaWXFWbc7HSBvk7pBMdou4vRy7D1HNY9HAyMwIF6GBqun
         PsuXYlf1HolAKB5T09pSZhnlDKu8P10XMppLGJrLe2I/HMNtgIgyuyBzMBh2lGFooSRs
         HbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764565145; x=1765169945;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6pAnWnIu5S46aH9KnsXkcZMO4/jxhslu/gl8KYWhSqM=;
        b=fCJcus3WN15YO5FIh0+5y2C9+wvP1zjciWD8IWHp4HYTdVb/8MK2kAZ4ujAw4YYvEw
         onRSg3SslYOb9LfIdl8965j4g8HZ/5K4IVW0GruvExPgVOiRlTPSXJGPCp9DYoj2n0BN
         lJc7SiNFu7dJuiFJgXiUAhqnYZfTa5CVipwCcDw64rAkl0qMZdzGw9ttmV0ENJo0OBEj
         jd1o4J5jXFJ2juUt9aOpe5OCfxDF69OdRZAczJkifqizIt9BgNw2aVtxefnEZWMTkHRH
         YkPpIjLEj5NiNRCYBSxuZsUIjE7CM/VEJkNgXhKGOSYzs04jXNA7FpZAMTlVDgKrhnMu
         udGw==
X-Gm-Message-State: AOJu0Yztleu4PBw5vAPekRekPzJqLpsS6BU61nWdpQkhmfikR/m6SfX7
	9+uGHzhCNmrkV2oN5r9yiECc6w2K5Y7mbl0C1eLiRRTwriJUWYfY4rbc/1BfU3D4DgU=
X-Gm-Gg: ASbGnctIATcK4e0KP6tkqmE83hXZcT5OwE3XaHjOQN4XZrkGk7ZShGPCA16j3c7XQap
	F4oLITfuhHJs3pPsbU5jjWhTZhTGtXmBzsINSfktigc80BpS8QTSPvXHH7sKrN1+JVNcDi7UHIk
	jCP/yLBY81uUoYmeXEYREm0+fGAdSJEsuuzlNOMFCcaCC86gwohWNpnGlJH4dXdrvS3ReEOV68R
	Qi2pyydVFulaFQrZWtwjkpvEGqIArmwSHbEaEXpvPwvGts3S3EOgdq4i+KP9TXm08A3n7EveRmQ
	dfE83mP+Wq8j9MUCBTSGvVetuztDXX7PyBmrTWlxCMzbK8jmDTWh+NcsZRxRukavN+g2ErmXloU
	ILvm7KmtVYpoHZ/ChABs5nJ+KO1cgqHyG/0aNJvbbpl2aI7s8h3ZXz3SuNhxsHhI+FQ4WIf5vW+
	3gO0gx
X-Google-Smtp-Source: AGHT+IGmjx8PrX6KPsHurYpPBqeLlRTCXu1OJva+hUdPeGLMwD0iZbQ70UsIEmmYQmRQk/j61QZqZA==
X-Received: by 2002:a05:7300:5a1d:b0:2a4:3593:969b with SMTP id 5a478bee46e88-2a71927a5a0mr18575760eec.24.1764565144618;
        Sun, 30 Nov 2025 20:59:04 -0800 (PST)
Received: from 1ece3ece63ba ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a9655ceb04sm40157011eec.1.2025.11.30.20.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 20:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?b?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQpIOKAmHNldl90aW9fcHJl?=
 =?utf-8?b?c2VudOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtZnVu?=
 =?utf-8?b?Y3Rpb25dIGkuLi4=?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 01 Dec 2025 04:59:03 -0000
Message-ID: <176456514339.2642.17409010068566138864@1ece3ece63ba>





Hello,

New build issue found on next/master:

---
 ‘sev_tio_present’ defined but not used [-Werror=unused-function] in drivers/crypto/ccp/sev-dev.o (drivers/crypto/ccp/sev-dev.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:ce1c65862af14252fd16691d2f1397e0a5827d32
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
- tags: next-20251201

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
drivers/crypto/ccp/sev-dev.c:1361:13: error: ‘sev_tio_present’ defined but not used [-Werror=unused-function]
 1361 | static bool sev_tio_present(struct sev_device *sev)
      |             ^~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
  AR      drivers/firmware/psci/built-in.a
  CC      drivers/crypto/ccp/tee-dev.o

=====================================================


# Builds where the incident occurred:

## cros://chromeos-6.12/x86_64/chromeos-amd-stoneyridge.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (x86_64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-chromeos-amd-692d0f81f5b8743b1f6e0fde/.config
- dashboard: https://d.kernelci.org/build/maestro:692d0f81f5b8743b1f6e0fde


#kernelci issue maestro:ce1c65862af14252fd16691d2f1397e0a5827d32

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
