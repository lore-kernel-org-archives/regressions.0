Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C4B43CEF3
	for <regressions@lists.linux.dev>; Thu, 15 Oct 2026 21:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099550; cv=none; b=pdPBinGWCvAD1dz5QlYBR3dV3vea3LUYAkhUv7IkrZLILDaXHNVY5nqY5iMVo5nn3GnYvcGj8ctS0MrnISE88Qom/TTfAzl043fXvEqMzlbfN7IbjFKlakkxd2yJ0tmutUZ73weF8ukzjWmphge+VzC2/QpaKB7798fdxaA56iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099550; c=relaxed/simple;
	bh=Kf30i8cGqP3IPHZ3WCA4IROcb1QglSnTECh4JWUUq2s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FTdwYwGzWs6aF8EcRYzicaD3EhAU2IF89VyVsiCuldNtVMxSKprQh9GEsvftONdwMZTNnNYJVtpOQv2nuNHtBEq5+R61e3YEFp0Blq6PRsWKGDZtC9V7aFNwyI1OTUgbU9PuHhTXIrRxiO4yfATuADCRM6DqgXM8spB/rLrqI7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekHq1AO4; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekHq1AO4"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5e8e8228183so120165e0c.0
        for <regressions@lists.linux.dev>; Thu, 15 Oct 2026 14:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792099548; x=1792704348; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hmU7byQJ7V4GqxfEroCMT0quvOeWGZm1zt5/8tVd594=;
        b=ekHq1AO4fQ38rZc0GxfRpDSInePP4n4E5itOaGmINZdtga5mSbD+nTijUh5gZtlAMz
         CIS+Ta+yfmHLWZuuwjxo7J6NGZiXgny75W6ORr4TmSvKTWlRDNG9gugoYFaq/p1VemiU
         BlZWXC7tQ7SYnL+eVQt+KqvF+M/EDLihfAORbQo9Vu78J/ZgRS0v2cmnD4lPz70oacmI
         6qAOJRqKoS2aOZnfljMbPJdO95TGskOWZFGgyKIj6DTWtAYPWZwKLxsXYrtyDEpBnQ8C
         RYn+HbKxQic0GjjcdJAspngm6BT74eRQF6gQXKrAIrafnP9DxOllTgxc/GdCnANmY8/u
         Bn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792099548; x=1792704348;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmU7byQJ7V4GqxfEroCMT0quvOeWGZm1zt5/8tVd594=;
        b=PjbBIXTwyXlpX4BED6vhVUfuAILhfVaa3mdIOwBEy5bMaxhHkN8kAgyiPoGh7wbJaq
         D/GbO+x471I9/MKbwhDudEAiZtgIrtFsdfyoo1KKJDyY3P/uP45HqV80tfjCt4mAbORY
         YJQeARyJ+zWhMwAJXzABFAz9Pqu65fBxNrdrtAlYiXtDB8L62CP7eyngouOBLUgK/Y2e
         lElUtfqkqXiEGRC0p+TzPz2/4Gwk7Y6pfxMVYTVl5m43oD9j9rZ9P3/429Nv3ocRMkTN
         4LvuCX/FgDQ4zzlhqYweVeaZJ4YzCX5qUuILxCRe2JFlGQiMiQysCXpks0rovrYMw2UG
         BDfQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7KH9P+DUa1Rk2Uz2TjVmbuDtU2EXMKZvEQt/N/U+g+D9fq0ioPuj4Wa3Zd+PIQIXMMwKPlsSftAv44g==@lists.linux.dev
X-Gm-Message-State: AFq9FYJSsSR7l5OvTLYyvE/pYEH+JRqlrlEOm3KuVMgXbSDNi1iQlTKI
	XZX4s+6nnH7pNLbo4AkDXYue6oUOfYPnhP+7ugU8Be6K9Fr4vVS+7LL2
X-Gm-Gg: AYBFou13ePqTuLAr2vLXGW0bTlR7rxdL6JunB+818c5wzoyqsVyJZjCUaOb8542D4uY
	YHMLeleB6Z633XbhPW75rhkw5Ab+gW2jQZUNoyRnk0X7l8TUk1FcpD8bbGcJIru1mb1FEMYSmBx
	+683oQC5fgZtJgqJJvwM8o+fFg+B8JEeKIsyMQNcdmvCEF5mU3hHN/KgHNKQYci1QKqGNCEQiDC
	dv1cOlWR854aAY7mNZk+mTF5LCCFTz1+ZIcYsyM7o5OTLQrEK5P/kjkiuGmYr8bs5/KZ7tu915w
	xb3aSsoeltHsm5VL+OCLMGuL0p3j720I0h3vdnQff3Iemh4H2s/wuswef2UjCKCdCkHhyHnD/uQ
	TVDOU/pCvPZOdDqw8w/0Z9wHDxIX7szddA8BVQkQBX4LA/zL/fPc2vVo+afYiqmKHM34bg9pIZr
	I2TXLjyfHpN9QqIvMYij1/sykTdy/aOQVUJCxB9Otq6v1lbyk0xngBSylnzgFF+9SuLQ==
X-Received: by 2002:ac5:c001:0:20b0:5e9:4e2b:4c9f with SMTP id 71dfb90a1353d-5e94e2b4d71mr3032400e0c.4.1792099547922;
        Thu, 15 Oct 2026 14:25:47 -0700 (PDT)
Received: from localhost ([2802:8012:9f:dd00:c85b:fc61:635f:8eeb])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b53cfdfsm190902e0c.15.2026.10.15.14.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 14:25:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 18:25:40 -0300
Message-Id: <DM5Q9NKRO89O.22R04QM8YBKWM@gmail.com>
Cc: "Broadcom internal kernel review list"
 <bcm-kernel-feedback-list@broadcom.com>, "Jai Luthra"
 <jai.luthra@ideasonboard.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Stefan Wahren" <wahrenst@gmx.net>, "Phil
 Elwell" <phil@raspberrypi.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Umang Jain" <uajain@igalia.com>,
 "Kees Cook" <kees@kernel.org>, <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: Re: [PATCH] platform/raspberrypi: vchiq: register bus at
 subsys_initcall
From: "Gaston Gonzalez" <gascoar@gmail.com>
To: "Martin Wetterwald" <martin@wetterwald.eu>, "Florian Fainelli"
 <florian.fainelli@broadcom.com>
X-Mailer: aerc 0.20.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com> <20261013131435.1454019-1-martin@wetterwald.eu>
In-Reply-To: <20261013131435.1454019-1-martin@wetterwald.eu>

On Tue Oct 13, 2026 at 10:14 AM -03, Martin Wetterwald wrote:
> Since the VCHIQ interface was moved out of staging, its bus is no longer
> guaranteed to be registered before its client drivers. bcm2835-audio,
> still in drivers/staging, registers at device_initcall level and now
> runs first:
>
>   Driver 'bcm2835-audio' was unable to register with bus_type
>   'vchiq-bus' because the bus was not initialized.
>
> Register the bus and the platform driver at subsys_initcall so the bus
> exists before any client driver, independently of link order. The
> platform driver probe already returns -EPROBE_DEFER while the firmware
> is not ready, so probing earlier is safe. When built as modules, this is
> equivalent to module_init() and nothing changes.
>
> Tested on Raspberry Pi 1B rev2, 1B+, 2B, 3B and 4B with VCHIQ and
> bcm2835-audio both builtin and both as modules.
>
> Fixes: aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")
> Reported-by: Martin Wetterwald <martin@wetterwald.eu>
> Link: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R=
272j6Bs4tg@mail.gmail.com/
> Closes: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio=
5R272j6Bs4tg@mail.gmail.com/
> Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>
> ---
>  drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/d=
rivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> index e78641703252..d35f5ac5c2e2 100644
> --- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> +++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> @@ -1462,7 +1462,7 @@ static int __init vchiq_driver_init(void)
> =20
>  	return ret;
>  }
> -module_init(vchiq_driver_init);
> +subsys_initcall(vchiq_driver_init);
> =20
>  static void __exit vchiq_driver_exit(void)
>  {

Hi,

For Raspberry Pi Zero v1.3:

Tested-by: Gaston Gonzalez <gascoar@gmail.com>

Test setup:

- Branch: patch manually applied in staging-next over commit ec1ecf4f23c5
- Setup: RPi Zero v1.3 connected to a HDMI monitor
- OS: standard raspbian with the desktop environment enabled
- Driver built both as a module and built-in.
- The following command was run to test the sound: 'speaker-test -t wav -c =
2'
- Result: Both HDMI audio channels worked correctly

I=E2=80=99d be happy to run any additional tests if needed.

Regards,

Gaston
