Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAF818E1F
	for <regressions@lists.linux.dev>; Fri,  7 Nov 2025 07:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762499084; cv=none; b=OSOGgx4Yf/wd/m5E+F59L196NNdJk1TZ8d5aJN8TRC4z3spHrP8BHUQrUMNdVPXUUP3HBmy3XtNERI0vhyZopl5NuSvia4xmyUhocsrfjL+aOgh7QscSCBJpag4tmVof/Bq/HI9RdKL/9DiCmLQMMcAjkzeJFOTbsq16Wer493I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762499084; c=relaxed/simple;
	bh=XtzOsbt2hl6xTu2IJUUbKD60Sc3xgdEK+LN2FPoMKUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FycfPmBanhdv1WfxSqPyFbkZKd0hPhPO/QmsuGEN7k67r54bJ4jDxpIVAyPgnBZ7yD+4qbw9SyKxCMEcwxNTJcFnP5R2rfm4doOBV7uAQqE6RtQT4VEbY+0tCci1OnTwU9/n6BjEFZ8z1aKG5kFmcBw2H4JNtddUHWScq2Rm/Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=ngt9f750; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="ngt9f750"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ed9c19248bso807501cf.1
        for <regressions@lists.linux.dev>; Thu, 06 Nov 2025 23:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1762499082; x=1763103882; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MYnIiKrQX8aCtjj//tDqMdxlWqP5fq15qVk6nPAkZoo=;
        b=ngt9f750kOEM/XJ9ZDLa4A2SpR/JetDw/PwByEX/QUognoTgdNfYyldtJPbBO58sre
         WH7TRNKsEF1YgcRNld+lGpLXwzl3+skfmTzqBmdv+IAMYf+d5omfcgaRAbEMmEgQHRIw
         nRSSukTE1wdtph4Xxk3M7VMuRbc1LgfeHnj1GCMNJ9jSoQVxASl/rvijNwHivbuNHjF9
         gctvvC/ocV+4wLqqHg6lQ1Ls584XQ4U1CeQP0/XrWuG1O8t5lEosolfEsBaID3ogYlPq
         +d+nJsZLHM4pwCaaOyr0hnFgXuNJcSf7dZrmRC3SSkN11PwKk4l4lRuT19pzQQx4nevX
         Obuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762499082; x=1763103882;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYnIiKrQX8aCtjj//tDqMdxlWqP5fq15qVk6nPAkZoo=;
        b=WEDOAQic1/HvVeIin83FLnrZpyrVW+LdtEeilGcQ6TrnlTx0sZ3LCglU0lStq0ZJUo
         BYArSOOjbj+tbm6Iyves1cWUgr9edQcsXw1L44QfU1haOTX35Ov+JzFkKpceTgjA9mCm
         pZoazsojEOWhjqc9R3VUuMl0jQCW9yXIG+XM57/uaImKGsxao8Tg7hu1Y16mY6hVpbbD
         B+idWyJjCCjlK/oyyk8pi3TlMbCXIWhv1upAohNBFKaGPwlxfgI1i/p6r/CnLPj6PF4V
         N3VdVLPoU92P1XEhBQt3PsobU6NYITx0iAgjDbDrLrYVZxzGjW6siZbCBQSzhYRbZkxx
         c+yA==
X-Forwarded-Encrypted: i=1; AJvYcCXXaBMuGVpN07duxN0yakcXYZR3eLa7jRteuk/ONA+ZMZASGglJRwSXTA3DFo97ZKpaI6FEdfE37DHaOg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8i4nQYBQdN28HtFLdnJtrGRiJhqvHYwR++jyyXVBjD97OIqpK
	bJKFyM6SMeWXGQRSwW0tVe5p8obJOr6j2fP0YwMzrgrZjBdNdhkAQpimXQhe2+AweCo=
X-Gm-Gg: ASbGncsKFkyAItJfTQNU2CgwLMsYjGErfY/HFN1IP+q7rk1qCXRROqgWSyT27FqhvMS
	1eNsAcTVQ1Eib3awa//EZ9x/aj+hplKi0sTpzP9d4AenSJsfTNUdcQXECcZq+WmLIJQDrd+VkHD
	lySKKwxLhnwM0nk/RWRZPXQdmjREpbU3rGNytIEclH2xmL7GJ7DamM8feOMAF5bMQIDHqElm7rw
	vSF0Q6dD82fkBGpFs1eAN+9phetbvj+AR1KsMgp5Yd7oi381VU8yPZsp7eO59ljTu7y/PH+EZP0
	H9PJZbUzktATkWP/3tLuqbgvQexGgbLS/IixH2yyO7rc8LjrFurKCO9J/mHKqkNNJb4akzN/Xrf
	nqB5BsMgSSz2f1vTTWhQD4n56470++iE1onOcnvQCabQqNlwoX3TdpFYr4+Fy/vpmb4ZJ/vkfEo
	r4Gi6roPzFtxi5Ffaiewr7tsCPA+vgHA==
X-Google-Smtp-Source: AGHT+IFwNzL1muZtb0IN53C7CPHVqzEIYh0SCwcsQzMl/w3PfdY3Ho9ZrT9AzNk7OQH5c7wzQoWICA==
X-Received: by 2002:a05:622a:111:b0:4eb:9c80:f6a0 with SMTP id d75a77b69052e-4ed94a4b3bfmr30924711cf.52.1762499082271;
        Thu, 06 Nov 2025 23:04:42 -0800 (PST)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-88082a3ac4fsm34529256d6.57.2025.11.06.23.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 23:04:42 -0800 (PST)
Date: Fri, 7 Nov 2025 02:04:40 -0500
From: Nick Bowler <nbowler@draconx.ca>
To: linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	linux-mips@vger.kernel.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org
Subject: PROBLEM: boot hang on Indy R4400SC (regression)
Message-ID: <g3scb7mfjbsohdszieqkappslj6m7qu3ou766nckt2remg3ide@izgvehzcdbsu>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

After a recent 6.1.y stable kernel update, my Indy (mips64 R4400SC) now
just stops booting early, just before when I would normally see the
kernel messages about mounting the root filesystem.

There are no further messages of any kind, and the boot process does not
appear to ever complete.  However, the kernel is not fully crashed, as
it does respond to sysrq commands from the keyboard (and I do get output
on the console from these).

I bisected to the following:
  
    794b679a28bb59a4533ae39a7cf945b9d5bbe336 is the first bad commit
    commit 794b679a28bb59a4533ae39a7cf945b9d5bbe336
    Author: Jiaxun Yang <jiaxun.yang@flygoat.com>
    Date:   Sat Jun 7 13:43:56 2025 +0100
    
        MIPS: mm: tlb-r4k: Uniquify TLB entries on init
    
        commit 35ad7e181541aa5757f9f316768d3e64403ec843 upstream.

This reverts cleanly on top of 6.1.158 and the resulting kernel boots
normally.  I then reproduced this failure on 6.18-rc4.  Reverting
35ad7e181541 on top of 6.18-rc4 also results in a normal boot.

Let me know if you need any more info!

Thanks,
  Nick
