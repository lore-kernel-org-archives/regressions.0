Received: from mail-40141.protonmail.ch (mail-40141.protonmail.ch [185.70.40.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B81176233
	for <regressions@lists.linux.dev>; Fri, 25 Oct 2024 04:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729831972; cv=none; b=ebxmCtsLKnZVQPUomylYLUJb+PBf7WA7TY2vHyFbiAaqX8VOMGwzk7wR5iupaTxdI9uJmh6+Snjor34lwFW4m/vWcQtdmc79MhdciECMdHo3oIR8oxN7S1mR5puoaBcKhvcoc60kGlg7Whqbeg49ox4qF833u0BXwrUcklRounE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729831972; c=relaxed/simple;
	bh=RGGpCfZfpksqP5CpiBryi//KERGu65h7PTpZDydu34Y=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Pr7fciEmsYspr6nje+Gred05WAyS587D5p/ovz6Ir2zHSOBtRgYIqCKraXrknxcPXv490LocNcQKWi0BsH7uPlLga3qC8QM0zCbuKc8Ylbl33OhcWMJgF8Oz2hKdvVVF/8YroReKWMn1OjsH3Vk2cNq4KGscAdBcW3WWexfpbQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=KZAJuGyl; arc=none smtp.client-ip=185.70.40.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="KZAJuGyl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1729831966; x=1730091166;
	bh=RGGpCfZfpksqP5CpiBryi//KERGu65h7PTpZDydu34Y=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KZAJuGylY36SM06guinxRI52yJB3ndWuxWumXC71pZGHtKtV7n3fjtvCy90ueAfLx
	 vnYuJ8uAtI5NcdNtQddgkDKjtwt56DRr0aU/KQrRxEhRT6lvP1yGkGKFdK9yXqOjIs
	 goUfMTjswtEIXa8Os9eWSeVhmJqvyikZnT8wDWuWOaQ9IyN20JgGNNayd3TWyWZpO6
	 XDJid5E/PGk2IVouBmFJOeXrQlZ/af/km8AO6ettEIk9kYGn08G5o8GvLamQZ7tDSK
	 yb6Kd/mj6fuYReWZF5NbjCqF2cnnMzJ1DTgMEZ7l3sobJAt22YOKngMYXtlXRTHrtA
	 mDaWhYf9BpahA==
Date: Fri, 25 Oct 2024 04:52:41 +0000
To: masahiroy@kernel.org
From: Edmund Raile <edmund.raile@proton.me>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, regressions@lists.linux.dev, stable@vger.kernel.org
Subject: menuconfig: missing options in drivers - input device
Message-ID: <5fd0dfc7ff171aa74352e638c276069a5f2e888d.camel@proton.me>
Feedback-ID: 45198251:user:proton
X-Pm-Message-ID: b7d4de6d7f34852a123a3b469c793833afcf5c2a
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,
I'd like to report a regression to menuconfig.

In "Device Drivers" ---> "Input device support"
There used to be submenus for keyboards, mice etc.
Now, only the entry "Hardware I/O ports" remains.
They can still be accessed (and configured) by searching for them,
then pressing the corresponding number:
/Keyboard
/KEYBOARD_ATKBD

I also determined the commit:
f79dc03fe68c79d388908182e68d702f7f1786bc
kconfig: refactor choice value calculation

#regzbot introduced: f79dc03fe68c

I've only encountered this here but it is not impossible other entries
elsewhere in menuconfig might be missing aswell.

The issue is present in stable 6.11.5 and mainline.

Kind regards,
Edmund Raile.


