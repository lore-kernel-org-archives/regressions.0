Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C26B79B99
	for <regressions@lists.linux.dev>; Thu, 18 Jul 2024 12:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721305796; cv=none; b=YZsEBydyrvU4Fp7kccfvLbf7wDOjDmMpMnOtV+mLZIrtLyRfnxb0pkEf3vLl4rCqgkcYbdKPANmv4z3I255Lq8MBhL+A1x/WvfkxuM+j8eITMYd5VRejg4t+DgR6KPBFZs1IomqucrkbbDWDlBD7PdwEsANgahRL2dC7CsYd5Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721305796; c=relaxed/simple;
	bh=m2SEt3T2kjY4+Ov8IvCoLE+6CrWGgIA8XpgFh7Ia6F8=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZHjaM62msAtejkiEvZHJBNnud0tez00KknfkYjIaIpuUaKvSvUHand3t/FN63faS26b6fpQHnndCktzxHcOMnQWtYwbabcXclChtG82/BKV0B+USQ3+EQetxCIPqQz2BVMWSAsGPlADqIkLcFm9MtjQDFtZTsYxdfjozmxREuik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=V1w4xwbr; arc=none smtp.client-ip=185.70.43.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="V1w4xwbr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1721305792; x=1721564992;
	bh=m2SEt3T2kjY4+Ov8IvCoLE+6CrWGgIA8XpgFh7Ia6F8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=V1w4xwbrMQF+JCXkyERuIUisNW9QTc4Unf7CXh0/e85N2QHUU4Us0I8LSfDGBc2NI
	 SjbRq14bYsFRluZjAfv/Tsd6YXDTavqdfw6ab0qbVlYqeC3N4zNIddOV8yL3rPGKBE
	 GBb+T1ivmsH71PFGNV6Hqwti28hIGWRt5tIXZjVZZk3A5qB2KKylOOH0nHznTyd7J/
	 YWhHKpohOtzPGHAphYWAnAT0CYiLXiv3KHDacX/b6KeJ4QiUwKqvnTKAaBfvGalDeL
	 b88/xKqFJQxSfuEH7DFvPRIYwrEV/n8BjycbJpKczBGP99+VSkRaswFpSkY+pjAoVo
	 DuBboQteGgY7w==
Date: Thu, 18 Jul 2024 12:29:48 +0000
To: stable@vger.kernel.org, alsa-devel@alsa-project.org
From: "edmund.raile" <edmund.raile@proton.me>
Cc: regressions@lists.linux.dev, o-takashi@sakamocchi.jp, tiwai@suse.de, clemens@ladisch.de, linux-sound@vger.kernel.org
Subject: [REGRESSION] ALSA: firewire-lib: heavy digital distortion with Fireface 800
Message-ID: <n4jdkizinqfoztqn2cwv7uqqqnvkyu2xk32qebazqznh74b3d3@r23skt4k7mqe>
Feedback-ID: 45198251:user:proton
X-Pm-Message-ID: 813c186901566fe7b46392b8d79e9e54e51d48d8
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Between the kernel releases 6.9.9 and 6.10.0, something changed that causes
heavy digital distortion on playback from at least ALSA and PipeWire.
The rhythm of the music is discernable in the output, so it isn't just
random noise.
It sounds a bit like bitcrushing, but not quite.
The generated overtones appear to be dependet on the sample rate.

I am sorry I can not be more specific, there are no kernel messages this ti=
me.

As Mr. Sakamoto recently committed all these changes to firewire he might
be able to identify the issue easily, which is why I'd like to ask him to
look into it.

Kind regards,
Edmund Raile.

#regzbot introduced: v6.9.9..v6.10

