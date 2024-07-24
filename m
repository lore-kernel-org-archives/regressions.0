Received: from mail-4027.protonmail.ch (mail-4027.protonmail.ch [185.70.40.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B241A12B143
	for <regressions@lists.linux.dev>; Wed, 24 Jul 2024 22:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721859878; cv=none; b=sglaM+bIkRzKXUfV9x5Bw03F67qV/NGS08M5k6KfbuWCMHcmwTk6ovZTcr3DftFcL9nmIY4E+AEkQXqi1BHLi7H3RoxdmZyNKHFCgNqAAU7wc1awYExiKxPmOjgBTkwYbuw4k5INRS7V8jZm6IjlOaU0jKkdPdu/3ysu3opWZz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721859878; c=relaxed/simple;
	bh=FOX3CF69PyQxiCr877/OkmnO+5fy6DMx7+bI5kwdjKU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VdD6/DoOF0k7fzFQuADuO+EKTkYnkaoTr1DPQY7rDcdu1Bi225+IcUdAI2PKxQ6S5O0wNIMnn5PkwpD4IEzyfwklQxhe/vnv1t52gsCc6BR3h/1RdHpumiA1Vr4HI1O/P7jHb0982mMoVBen3ePy2QVoZR1gPa2cNLc2V3ks8mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Eivfab7h; arc=none smtp.client-ip=185.70.40.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Eivfab7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1721859875; x=1722119075;
	bh=FOX3CF69PyQxiCr877/OkmnO+5fy6DMx7+bI5kwdjKU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Eivfab7hqgtkUXTNdb2EXVzsbeQvmvLqpGi+fq3NDaImsy9l8CnY1+stYNO/1x7l1
	 WUedn1jJ1OiWwcU+9Ldn//ULgGBmi439IwDnMxaixyBHJhDBDBa+s+0emS6sAfdh78
	 jzhlcaHiGS+j4POtjtnFIaR0vbSOAEltSt/uxEDpsp6ZWbCOzFLifoaLj5BEgXJ4Lg
	 3fRiH9YTgv53PnKPTMa5PBz0D5XQweBT5yi3iX5h2DjNvUq4RqKJVwR9kkqEx0Vp5s
	 Ypgq4p4gt+wlaSVkwfiYopsofbfu7Q1FnP8Gl02AGI4kb4wsRT5bxA6I30Ohl6ZuYU
	 0/uq/BSOadugw==
Date: Wed, 24 Jul 2024 22:24:29 +0000
To: alsa-devel@alsa-project.org, stable@vger.kernel.org
From: "edmund.raile" <edmund.raile@proton.me>
Cc: regressions@lists.linux.dev, o-takashi@sakamocchi.jp, tiwai@suse.de, gustavoars@kernel.org, clemens@ladisch.de, linux-sound@vger.kernel.org
Subject: [REGRESSION] ALSA: firewire-lib: heavy digital distortion with Fireface 800
Message-ID: <rrufondjeynlkx2lniot26ablsltnynfaq2gnqvbiso7ds32il@qk4r6xps7jh2>
Feedback-ID: 45198251:user:proton
X-Pm-Message-ID: e4a59c6ab075e46504783ff58826a51143fc3be1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Bisection revealed that the bitcrushing distortion with RME FireFace 800
was caused by 1d717123bb1a7555
("ALSA: firewire-lib: Avoid -Wflex-array-member-not-at-end warning").

Reverting this commit yields restoration of clear audio output.
I will send in a patch reverting this commit for now, soonTM.

#regzbot introduced: 1d717123bb1a7555

