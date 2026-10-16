Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF4143F4C2
	for <regressions@lists.linux.dev>; Fri, 16 Oct 2026 09:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141249; cv=pass; b=LqPCWHewDQHBsa0vO7DakbuDocNhJctQpkGUyYp0AadVVFB+MnZ1SgqxGuZ/czBVnXUMcUs0PefFQESZdbJdZ6PB96Dw26DaTTmG2CdmXPREF3H5AQfReL1+PJHPTWcmr2ENXGLX8aXyZUtiXIpgey26pp96LtafBL06jDDZnlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141249; c=relaxed/simple;
	bh=nWdidaYaD/EM9Kvjs513vStZW9/Xbr2SiK+uWxRl9+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kbYiUEz0UUAM7kLmG9DpKWhlU4ES5UBZg8NNR75r1hKkynh5w9ATXQl3pkPPtikrIs0WpcTIH08J/8WXXGwRToavluMrt3zc7V1NhtZfkRjqQ1NzRsQa9NysLEobDoq3dk9ddwnxOKncECQcG11L//XOuSMNTqcfECVHk1gX6Gw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu; spf=pass smtp.mailfrom=wetterwald.eu; dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b=E5yMfwjC; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b="E5yMfwjC"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a75f960be3so33614341fa.2
        for <regressions@lists.linux.dev>; Fri, 16 Oct 2026 02:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792141245; cv=none;
        d=google.com; s=arc-20260327;
        b=WrT5sx8BUOhdTLzzJe8jnTCGnbtTyLEhuqblgbyqUdPj6jvsFrxpBdA/W3bZAoaiuB
         5nTSoSPILLHUCy/KgeRIGLhOyFRzpIhGAtHhRZoonqTdsyd403gzeGLVl0uhqvDJvJkX
         5WZpJ3giYFB5jyQxCyV9LtEKLSyVYmKJLVrT3T6KWL8ium4eQMwyoaPFW+ae+8nR+ENt
         2Lci/2WJ7IzHnFop9031r0+4iiaB8S/FtPu0qk8pnuETxobWe/+CmzW23t2xX4cucvwN
         qRuRl13oDmqjRwBz32EiE9b0G8pXviq3EcxD44QW8fM/rW4+nUqeG003KFX5fzsNqmDH
         lImg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YybyPuhgsnKy9RSuW90vvdft3eNm7NMwNdUR8p+bdAY=;
        fh=N/Xlh3rTJbZvlA6I+hjgClS7EOvppNVigT5Nt2usqcQ=;
        b=ccNz0X57P+/0vDy/leVVb9Izekl1S7U7luwxGi7JQF7ZrTBddKBZVxRf/294QknlXP
         2BYAeyDUrcqdtQtau6PMyv6X3kQNPLbQowfOBIoOzPmLOG+cxksF5TfgxmBdL3kCZ+Ft
         /w9rI7oshCS9YSUiamwfb03YtYfAuidtetXc25OW4BBq2hW7lh35Kp3HB88BH+u4EInu
         UOHrgoPgMWwKDMBO2tsNGkmJhTuGglunHSx/H9UrUm+Ilbsfx4s84FDGXLkX7M2UtG8n
         zEA79JuZgFZjTePnh3bTM0ZyVc4jvsH/CIuyjy5kWv1Ue0zs0eoZGPy4RdMe6dCbFRci
         1tWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1792141245; x=1792746045; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YybyPuhgsnKy9RSuW90vvdft3eNm7NMwNdUR8p+bdAY=;
        b=E5yMfwjCMi5PHzkxTunWKRJAPpA8xJ4kG3Yf9UG02wLgdkNvA2LXVL1yNYxCQ0apa+
         3pPq3pWSHzAB2lUNi/N+4oFX7IdhdHQhzUT2QcwNZ2IBDCRaeQZp3R0q2FtPZeoSXa9Y
         rjG/Ks96Xf650AzCZ1k3TRDmz5HVVkCLUJv/PaZhp/Eo4pfqhgRQ8lkQOUdzfXZsO3yR
         dCwbqeqXrycZ02lAe7cFahixzVKNeKMyG6RERdG/+QQhDU6Ad5gTXuv+n065iuwgzecD
         Ek6p36bK9zriR8qPIuaRkeIASA/InwDfN1hqglma5FyoEM+vzansgEyiDal44csajiLw
         W9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141245; x=1792746045;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YybyPuhgsnKy9RSuW90vvdft3eNm7NMwNdUR8p+bdAY=;
        b=rf7oun1Bm7f/vl7TXLvIxU388OUUFZjDQ+lvZBZdYsH7v85qIdcaZXovZCL1/o/w9V
         08XK5FNFg+A0QB+dnRbYkX+QdS97N0gMXUMYk5jGguR3A/RAHf4c4AdwMfe3oWJPXZMs
         Cy4cXCKJc67CeyQL/fuclHFJMrj9ye+plRm5Ga9WAsUTjnnzS/PLfBhIxDKAwFhkZuMH
         wuxRH2maf456K8pKRRjlesL31v2X0p3aEZP0KyZ5J2Jz2CwgT1oWRG5BBZdO277ST0iL
         YytW9IL+40Z5rZRon8SFGCUhipd5QYjhGkH88lno/+SCqJmxaroYuOSlIa1YFJhmKsGY
         vR8A==
X-Forwarded-Encrypted: i=1; AKwUvBwZ1WjO0HsibonnN0/Lt8qTnFR8BT74mJAEEFb8H60YTia9kO2xsBeEnWCKn/XdIWMC/KkfcW6bsfhm9Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYIImBdEOtqXJAQH+KOElF8CJm3SMgEdPMIT83YSOow40nfLp+2n
	tKDqA5jp4hvYanqkgKaL0uPv72xs9erk0sLebSOy69jEVaAdEt4XSbgtF+U836JKh8uRdyrgSVg
	FKLxe9IPnfKFdzX7bjTqqBuL1G0dlaMERyBhg6B7CXA==
X-Gm-Gg: AYBFou3PSwBkzRMgXGpsiOWmZM9rd7OQbWItJrsgPlCIe1wP1sTb+PnDcq0Qj/DvcTU
	UkB2CF/ECp6pk3cKlViae6PpJeqWFIJguatVhG3aXxeNGvreyaFw/HvAThz8//jiX4TMKu6ETbk
	jFTQ8Xefht/V0J/vC/Do87vmE0DPUG83aKa2GililbsqUhmQae2+/LpU2GYKWzo61FTX/RZC+GM
	gT9osb3db8XI5jPTNVGkt1JuaVbQURmoOO8n9oOftUz2aqwjiwaY715zCa9J5yJZWXraKivQZQp
	RTYntz/k7hF1F9kbnL+3jq4m+wkFq/E8nvE9W4RWIzq0dm/CwnKxnXicwZUrPRngCffyjblzcGN
	5SfojIwN0h8c=
X-Received: by 2002:a05:651c:19a4:b0:3a9:c1de:852a with SMTP id
 38308e7fff4ca-3a9c4ebaaa7mr54573451fa.3.1792141244894; Fri, 16 Oct 2026
 02:00:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261013131435.1454019-1-martin@wetterwald.eu> <DM5Q9NKRO89O.22R04QM8YBKWM@gmail.com>
In-Reply-To: <DM5Q9NKRO89O.22R04QM8YBKWM@gmail.com>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Fri, 16 Oct 2026 11:00:33 +0200
X-Gm-Features: AclHuK-lXXEn4ydNCXPutfEMfjozHKlcvNq9MgkrJnOYo8wz6ecB5WmDos1rbFE
Message-ID: <CAFERDQ12QwtC6cCVWQGU1b5KCv988kAvahNKwosxG2z8Mzm4sw@mail.gmail.com>
Subject: Re: [PATCH] platform/raspberrypi: vchiq: register bus at subsys_initcall
To: Gaston Gonzalez <gascoar@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 11:25=E2=80=AFPM Gaston Gonzalez <gascoar@gmail.com=
> wrote:
> Hi,
>
> For Raspberry Pi Zero v1.3:
>
> Tested-by: Gaston Gonzalez <gascoar@gmail.com>
>
> Test setup:
>
> - Branch: patch manually applied in staging-next over commit ec1ecf4f23c5
> - Setup: RPi Zero v1.3 connected to a HDMI monitor
> - OS: standard raspbian with the desktop environment enabled
> - Driver built both as a module and built-in.
> - The following command was run to test the sound: 'speaker-test -t wav -=
c 2'
> - Result: Both HDMI audio channels worked correctly

Hello Gaston,
Thanks very much for your test!
It's great to have variety in tests because I don't have the Pi Zero, and I
didn't test it through HDMI, I tested through the Headphones jack (which
doesn't exist on the Pi Zero).

Did you also also reproduce the bug without adding my patch?
If the bug is present, cat /proc/asound/cards should reveal bcm2835_hdmi an=
d
bcm2835_headphones are both not present. And you should see this in the dme=
sg:
> Driver 'bcm2835-audio' was unable to register with bus_type 'vchiq-bus' b=
ecause the bus was not initialized.

Regarding your test: there are two ways for the sound to go through the HDM=
I
port:
- One is through the bcm2835-audio driver (using VCHIQ)
- The other way is through the vc4-hdmi (bypassing VCHIQ)

  # cat /proc/asound/cards
   0 [vc4hdmi        ]: vc4-hdmi - vc4-hdmi
                        vc4-hdmi
   1 [HDMI           ]: bcm2835_hdmi - bcm2835 HDMI
                        bcm2835 HDMI
   2 [Headphones     ]: bcm2835_headpho - bcm2835 Headphones
                        bcm2835 Headphones

Can you make sure that your HDMI sound is really using bcm2835_hdmi ?
If your sound happens to actually go through vc4-hdmi, then you are not tes=
ting
my patch. If you can't see the bcm2835_hdmi, you just need to add:

  snd_bcm2835.enable_hdmi=3D1

to your kernel command line if the driver is built in, or to the modprobe
command as module parameter.

> I=E2=80=99d be happy to run any additional tests if needed.

It would be interesting to test other "clients" of the VCHIQ bus (because I
only tested bcm2835-audio).
But I've just noticed that bcm2835-camera doesn't exist anymore (it was usi=
ng
VCHIQ via VCHIQ_MMAL).
If I understand correctly, if VCHIQ_MMAL is still there, it's because the
bcm2835-isp and bcm2835-codec drivers will be upstreamed in the future, but
there is not current "client" in the kernel as far as I understand.

The only remaining thing I can think of is /dev/vchiq (CONFIG_VCHIQ_CDEV).

Thanks again for the tests!
Martin
