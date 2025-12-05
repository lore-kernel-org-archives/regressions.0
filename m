Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF8E27B34F
	for <regressions@lists.linux.dev>; Fri,  5 Dec 2025 03:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764903613; cv=none; b=Ld6jhEtJDDTcwjmW4hiv0G9SPtJL9lfVf5yUg0y5qazj2h/PA7LCn7X4AYQkhswA/L3w8W+zfcS+JZMrmbjeSBYtbfnDt+iw/7tYM+FEZqO9UO3xn7WAzGMZCHfb3o8DIGNpB2IMX9XJTm4itnTGVGX0rTCx1Td8HvnV0t1pY00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764903613; c=relaxed/simple;
	bh=BKpeIhjmhj6kdLFvB7R8ly2YeYgOg1GbH87ku+ObXV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sdn1xvljnqmjv9ryUmBTFrRge9NsZ+aH+P3RDxJJJyPF72WAifuQMMz3FZyhmlcgLobqBfDH4q/ES3sPYCdDUPojvdzb0RrVsQxRBqbHm4lCJ6qLAcSc1awRSLDmuEb9wxcZTNHdpYHrf/AEQNlM4PbIdxqddFyFvjuJzI5VizQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJZAnR1z; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJZAnR1z"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37a3a4d3d53so15401101fa.3
        for <regressions@lists.linux.dev>; Thu, 04 Dec 2025 19:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764903610; x=1765508410; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktrqTmMo35L1GmiWq1iPrBlldw411tb2vqMzYnaOSms=;
        b=dJZAnR1z+Yzv1HZX3vOLecLqVoVN2gdGS31EYUT3nXFJG21/h+ju3LJniiuY8eAYKI
         yH3Sidk5lGEgX8e17ruyIl2gBgBEWvsJD+se3Er2MyCwRYRfsC+c0Ip08pXwRaZc+bbm
         5OmbdLUGs1fX/Ba8fXJUVRelRO3JZvn3c/2VtV18u7Lo+KzUgTPAo/POEUiKxky8CWtr
         sBm6O2g/nwM+Vx279LQMeKhQ/ebqeCFZ06lUlEbV8nPdtedAb2L2p59iInXzSs4X0kLJ
         RlYhkei1pWu5K5f6+GYvEtKriB6XZqF4TJAQ2gSCKks38rVsh3uYJMKouw5IYZJNCjij
         a8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764903610; x=1765508410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ktrqTmMo35L1GmiWq1iPrBlldw411tb2vqMzYnaOSms=;
        b=oM8AwhQJqhauysIN0Pz8PEh/iVrT8zWokOTD9zMJnjN8ZqhdvBuvwIoPDER74VivDx
         d2VDG0f8oRDNrFZG2IuQ3QK3MPwpxP600V2D2Tw9msUcVzTfBfbqOES+Qsw0h2cuwgiX
         LFVGOi0fV9a8bpkHjgt6m2LE4G4SnpCZA5BXcIbkPL1S2gq4WZzJaXBamVgDOmgMh2M/
         riWlBgyULnqtu0LIkVpydTq0Ki59SuNiLzhjFgYt7d7T5/A3AYn5WwPTp9EJ0bQD6IxB
         MGc6OYAL2T+sPA6EM5Wd4QZh9uRxrWUYSkICQBl3xD8gA2cCKUAMwIFHggv4+w4eJbFQ
         OLjQ==
X-Gm-Message-State: AOJu0YzRyMsXhZMlZB0x8AewBwp/38CSUFzJsUSPiQeLjvZG/nTomrXY
	WzzxzQxa812U1ZpN9LwlV/ICj9z061BAT1ObfKGIPYFM5sNonZLkkaCLVv5emQ==
X-Gm-Gg: ASbGnctPaIcZXcnCYk0FXZj/pWlchFcpQTPzNTSYPH2nfG7UJa7admw2nayMyUN+B/0
	Gk+pI1b7gdXo0Yp/ThPhPBRQRzuxfVxOLzV8p9JI/y+rjbmXnN7wC3LsARVZDx/mmmDFZ77wDjF
	+9vtAeCYPuQRGP38OxZsRfM/2Gxgp+lDEAJbUbqGlEd+Rw6TysyeNIEDKNS9FO264AWYp4sFfGo
	nU/EZi1QOjD/cwxXFQLuE/CSgPKPcw3HcVVI2XHn1ius7E6a2g0dYqActRioYUT5MNIMxN4iQr0
	SO3HUNWuebfU/RQLAAcJkzenCvuYl8D4cqT+andqy0RKhXP1d3ywT9l+fthzKTkSHDfMinO2NBr
	z8Cu9BWRQG87B/e2V0bikkLXjIA0ANVlbkbNYglHJTqryjALBIAMTXSK7mwhNY8y/87AA5CGtC1
	zIB7CQ/cbV
X-Google-Smtp-Source: AGHT+IGS5/rZHTGR3WYAtKqP8WplL1bz40KAqGQkq5JgW8ZKH9qyc4sZ4zwSB65c5NM7BtspOl3HGg==
X-Received: by 2002:a05:651c:31da:b0:37a:2f92:3bdc with SMTP id 38308e7fff4ca-37e63760755mr25284111fa.17.1764903609909;
        Thu, 04 Dec 2025 19:00:09 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-37e705e85a0sm10841231fa.38.2025.12.04.19.00.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 19:00:09 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: regressions@leemhuis.info
Cc: regressions@lists.linux.dev
Subject: Re: Thread for updating minor properties of tracked regressions [consider ignoring it!]
Date: Fri,  5 Dec 2025 05:59:30 +0300
Message-ID: <20251205025931.1638599-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <32a0d700-067a-4b70-ae34-46a63372ee5d@leemhuis.info>
References: <32a0d700-067a-4b70-ae34-46a63372ee5d@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thorsten Leemhuis <regressions@leemhuis.info>:
> #regzbot report:
> https://lore.kernel.org/linux-i2c/197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com/
> #regzbot resolve: inconclusive: reporter mia, maybe fixed by newer
> firmware, just like https://bugzilla.kernel.org/show_bug.cgi?id=219680

This bug is still reproducible. And today I identified concrete string for
ignoring wake up event ("VEN_0488:00@355"), so a fix hopefully will be prepared soon.

You marked my report as inconclusive, and I didn't get any notification about
this. I don't like this. I didn't get mail to both my emails (@zohomail.com and @gmail.com).
Please, CC me when changing status of my reports or configure your bot to
notify submitters when changing status.

How to reopen this bug? It seems your bot doesn't have concept of reopening,
and I don't like this, too.

-- 
Askar Safin
