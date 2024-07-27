Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF761DA23
	for <regressions@lists.linux.dev>; Sat, 27 Jul 2024 16:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722099151; cv=none; b=RS5hJuT/bjfO6ejh9RiJR7uOgYeWY5VYn5U/g8+vhnAyxX4xpw7bZ05bUqHHGgK2J7kIBJ9ZMOLz2AwqbiN92IeBVla6qg5EC+CPLxjRzn7fvWs44bQdnnVTh4l5kNhhS5sZWrFmv5cncdiyEx1RDwEPzr6VqBHMB1a+yOmSB+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722099151; c=relaxed/simple;
	bh=Kt3UTHXY6pUS1uNOKixy1D9DX1Rs2NDL7dotc9CQrko=;
	h=Date:From:Subject:To:Cc:Message-Id:MIME-Version:Content-Type; b=i5LPeL2E9dEZfYq8uXhi7Bp0fKHlDoCxaukfkcTvc/9GvEghvCNhR3WxxOjzVBed8xRnFLzByZsZdVbrf6bdHjzP3tKqxeqNfDnwWRKRRHbMAm/GxAdz0MbuMy1w/VKnZAv53mZIGYJkZdPWmhqq7RR3XvE+9j3/ARquJjRa8Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3LMC3O9; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3LMC3O9"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52ed741fe46so2369139e87.0
        for <regressions@lists.linux.dev>; Sat, 27 Jul 2024 09:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722099148; x=1722703948; darn=lists.linux.dev;
        h=mime-version:message-id:cc:to:subject:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=32TR7SGEwzQNHi8BSEjhZCZbMRgIoVZcq32HmZiwQ2g=;
        b=d3LMC3O9jg0FcXf4g4BPspPvnfKYuTz0B4mB2msoOWezkfmFcRDItd1U63Nl5JvIDs
         YrlmssFP3lDZqRhC2QoV4iNLTsQMtqNwA+EdgnOTEPwX7fDM0R5lPaIT+P2UIfCrfuAW
         6FKWw8JQ9si1Xq2FjTf/+et+Bvda96glF5krfCb36H4TrYJzpY+iNSXgyaTTKdnLY1tC
         jjm+ycD3whd9CuhowcoWe2mCu1BwnbdJf3gYsNTW+7Kqab7B7CA82kc/cS5bYILctAAb
         o0GUIUeH7UXts2utvGXbE06TYdTZ2PCSuVIizpRKgpRsBT6AoTZLg6U9B1+a/TMaHTGz
         HDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722099148; x=1722703948;
        h=mime-version:message-id:cc:to:subject:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=32TR7SGEwzQNHi8BSEjhZCZbMRgIoVZcq32HmZiwQ2g=;
        b=hQUaMCxXup6FshLas6QWfv+bU/D9WMZUTbGTm7SB/p4ZIGXgMln1E3sXUkUD3RXHVB
         YqOdRJhPRAV3wh+IEfNpU8NLDA7llwigZqBrKxTn+B0tVYwuBG/B+gzkrLEuWaDhvAdW
         ILUTiyCEUc26tuL+ycjHOrq2pYNsyXPfkjob/VYSvC1JnnyG+cfFcx7F74G3U0MpsmzY
         oHmFYpVEZgYTmpSrYZaVIKhE8D6C7hh60cBsabv0VSF0tIijSX+uZ2nOTPQjgS2Tdr6p
         eAPqndD0L0mSzEicbh00YFkAcl81+O5FFD0NBHm+aPVwXITabJeTzU2KGN/G5BKBrSAB
         O/Cg==
X-Gm-Message-State: AOJu0YwIt3SPyiW7+9XT3rvutdZ4UIYgiT809SC3hitLHwKWrYXfkxP3
	oxM5ai2COW2R5HtJg9oB7xQLr9SRYrBt4Iso62NbbcrTxOhAIjkXmQR4RpCi
X-Google-Smtp-Source: AGHT+IGuAop1O4/gAYTT5gL+X62ar7kjLB5+Ie9wR9wU6dXF9aYRZO7tFMq0G/kr9w7fDqsKQUzmGg==
X-Received: by 2002:a05:6512:451:b0:52f:d128:bd13 with SMTP id 2adb3069b0e04-5309b2c39d0mr1685683e87.39.1722099147651;
        Sat, 27 Jul 2024 09:52:27 -0700 (PDT)
Received: from [192.168.1.69] ([93.170.44.26])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bc42ecsm808811e87.49.2024.07.27.09.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 09:52:27 -0700 (PDT)
Date: Sat, 27 Jul 2024 19:52:19 +0300
From: serg.partizan@gmail.com
Subject: [REGRESSION] Brightness at max level after waking up from sleep on
 AMD Laptop
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, mario.limonciello@amd.com,
	hamza.mahfooz@amd.com, alexander.deucher@amd.com
Message-Id: <77KAHS.13UUH2XVHQQF1@gmail.com>
X-Mailer: geary/46.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed

Hello,

After updating from 6.8.9 to 6.9.1 I noticed a bug on my HP Envy x360 
with AMD Ryzen 5 4500U.

#regzbot introduced: v6.8.9..v6.9.1

After waking up from sleep brightness is set to max level, ignoring 
previous value.

With the help of Arch Linux team, we was able to track bad commit to 
this: 
https://gitlab.freedesktop.org/agd5f/linux/-/commit/63d0b87213a0ba241b3fcfba3fe7b0aed0cd1cc5

I have tested this on latest mainline kernel:

Results after waking up:

 > cat /sys/class/backlight/amdgpu_bl1/{brightness,actual_brightness}
12
252

Then, on exact this commit (63d0b87213a0ba241b3fcfba3fe7b0aed0cd1cc5), 
result is the same.

Then, on commit just before this one (aeaf3e6cf842):

 > cat /sys/class/backlight/amdgpu_bl1/{brightness,actual_brightness}
12
12

I hope I included all relevant information, more info can be found here:

https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/issues/52


