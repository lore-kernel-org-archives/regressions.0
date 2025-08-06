Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53D3224256
	for <regressions@lists.linux.dev>; Wed,  6 Aug 2025 08:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754468116; cv=none; b=E5iULCSHNvdTcyhdjTUyIXdNjKEtYJq3jUaNoywUwKCZ6pW+Y/Mr+fYTavmtp5gNWwydYRXf3FSIqp+DMr9b+0nQ3s+sfHwRmqOtRq06G4fE8djdMtSvO3lxT0cLGY/ZEwk0YSilHCH2CQlCxd/8fo+3M2rAiYVvVsScAhryk68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754468116; c=relaxed/simple;
	bh=IVUCScq+wgERBDN1As1mbw1tOvrOYQlA9OvBxMzkBvE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=B4oN5QgX7w8tVeMFsCkBLEy1Sg7/K7AulJXcvytGZC4Rm6EGuisAvXXToPusCokWFOQlSZIgsMVytf9wn1NbU71IesYYyVpxPWGDmLs20DMalkG/sU6iBj4XHj30wjy5mfxBLU/R5Qirs3J0RIwPM5pFga1Q2ehVYL1bKLkrWtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.192] (ip5f5af7ca.dynamic.kabel-deutschland.de [95.90.247.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 76E2261EA1BEA;
	Wed, 06 Aug 2025 10:15:09 +0200 (CEST)
Message-ID: <10172c80-daec-4e20-ab57-a483cf1afc02@molgen.mpg.de>
Date: Wed, 6 Aug 2025 10:15:08 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, regressions@lists.linux.dev
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Quiet crackling noise at boot and after stopping music
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Linux folks,


I believe the Realtek refactoring caused a regression on my Intel Kaby 
Lake laptop Dell XPS 13 9360. There is quiet crackling noise during 
boot, when GDM is started, and also after playing music is stopped. It’s 
reproducible with 6.16.0-04055-g14bed9bc81ba, that contains the sound 
subsystem pull request.

177bf8620cf4 Merge tag 'sound-6.17-rc1' of 
git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound

I uploaded the run of alsa-info [1]. I try to verify with plain 6.16 later.


Kind regards,

Paul


[1]: https://alsa-project.org/db/?f=6d2c66f2374b4ee6eb406a1d2cce60d1f17bed33
