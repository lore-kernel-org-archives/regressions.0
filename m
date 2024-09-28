Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612C31E520
	for <regressions@lists.linux.dev>; Sat, 28 Sep 2024 13:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727529595; cv=none; b=q2D2Qsh4Nxu1yDnzG1lfiNbYf51sNWOCYc7PL/fUSi3M4VVdMbhqnyKSNFRcwLLwW/e80494zP6SnC+IEjvY9hQgYTS7Bq9H3F9XpgyHXAhPo+veyrjDczTwoeDY4TPt526jTeZ/zDVpykqAah7toqbdpu/7FsU3noEuugt3efU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727529595; c=relaxed/simple;
	bh=FTxgGV0fndARRaInbJBSomb7m073sgDRktv/COxeuhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=earfTHPIKGMnK5dEOCah2WEj/7O/+CstCeXVePrWVF/qIFXA4Z+1kM0oowBgVf9fCmYwGvrM/XJUbNojyq03us8ijIhsdQvbyIj3rVgDrj0ONt37FAhbFHbKWJM4k5SVCIRl1e2W4WJaQ3ZpnTjz6KB9P2p/bNGjBeOGgYomXHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=im6gKqcQ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="im6gKqcQ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c40aea5c40so5407476a12.0
        for <regressions@lists.linux.dev>; Sat, 28 Sep 2024 06:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727529592; x=1728134392; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=QEHG4Y/lL09GG1v2gI8iZvDJa9no7rllEAszsGzy6GU=;
        b=im6gKqcQyBh5w3u2WN/E1uZEmNnTd4RX6dSvuTJrHA01ZGb1aXGtK6IaHAruDZCyY3
         MQrtgMz+rMFUpVlsqbWJhZ0NAykokprMtZfHjl+1ogrC38socirsEdMMxwWPc0IEAVqe
         v//XPeWi9H2jDmVxP6bI3bEAXWSS468U0Un4ydQIJHES134ZnUr/Q9O3lZ8MqXpxY8RD
         c0AZbi/SdOJtQtwY69khT2hqMNOWXmlAQhW9NSjMIKyoGdIj8PzGRNyZe4oyeL9xi8/D
         j9SO4aZ5gFt/U5Bqhla1cMBDOfN0AiXeuATDrIsaKs5ocYbuBePnVnqYVSEDPJ8VDA9+
         r8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727529592; x=1728134392;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QEHG4Y/lL09GG1v2gI8iZvDJa9no7rllEAszsGzy6GU=;
        b=gIRSqWOOgZNx4xzJRUk4yT7J/2zbhKVR0Pn14Kz0YeSpYvMx1t3NzBKDi7woi9491S
         hZJHKf7zo5EgcatpJpB2jUkDkmKJg9uAGvtMs9arJrYjv2mP9v3GQ8pxsd5gBzbkdEIZ
         n/Gzu+HfzKyi6q9X1+8R0UMa1+QgJ7ji9PNOwLYomZRxkYtlwhOjc9Qv51dYHd4+JuKx
         Rc5QWIHhF8VWu0MOcrJNrh85XY+Q9nkIZ3Y0jj8HqFMZ1x/mTsfASZM7YbNcvORvgNkV
         E4QSKGAReQxhzMoBT3qM55xLWkju7r3zOhXi5D8BLbbPstemd1EYP14dvI1jvlaFMCPC
         t4Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVk/wsWisQgILKEfaqp5Bxs60jstw9H5uoWIvgIWYzEpJ6NoggSkhRzDbG92+iSWG9i8BXbkvbFRtz5zQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEHvODUX4tXgyy5L8qe0Xtfscfc5FsiIkoV9imQGQmy1Bn9U+w
	Gh75Xr97MEaGXqgzW1Lm3CEl3uDm04h7dt8T9rLbpoxQj3IHVR9n
X-Google-Smtp-Source: AGHT+IHbW7D+GnxBZsSdqkqhplAXMnTaQ9xufE4rC3XiSWGLDgQLRazAH0M/yYKlYU6i2+CXttb1Kw==
X-Received: by 2002:a05:6402:254d:b0:5c8:8844:9942 with SMTP id 4fb4d7f45d1cf-5c888449972mr3305438a12.2.1727529591422;
        Sat, 28 Sep 2024 06:19:51 -0700 (PDT)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88248c672sm2281445a12.60.2024.09.28.06.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 06:19:50 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 36E93BE2EE7; Sat, 28 Sep 2024 15:19:49 +0200 (CEST)
Date: Sat, 28 Sep 2024 15:19:49 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Cc: Eric Degenetais <eric.4.debian@grabatoulnz.fr>,
	linux-kernel@vger.kernel.org, stable <stable@vger.kernel.org>,
	regressions@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [regression] Regular "cracks" in HDMI sound during playback since
 backport to 6.1.y for 92afcc310038 ("ALSA: hda: Conditionally use snooping
 for AMD HDMI")
Message-ID: <ZvgCdYfKgwHpJXGE@eldamar.lan>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

In downstream Debian we got a report from  Eric Degenetais, in
https://bugs.debian.org/1081833 that after the update to the 6.1.106
based version, there were regular cracks in HDMI sound during
playback.

Eric was able to bisec the issue down to
92afcc310038ebe5d66c689bb0bf418f5451201c in the v6.1.y series which
got applied in 6.1.104.

Cf. https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1081833#47

#regzbot introduced: 92afcc310038ebe5d66c689bb0bf418f5451201c
#regzbot link: https://bugs.debian.org/1081833

It should be noted that Eric as well tried more recent stable series
as well, in particular did test as well 6.10.6 based version back on
20th september, and the issue was reproducible there as well.

Is there anything else we can try to provide?

Regards,
Salvatore
