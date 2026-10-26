Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013655;
	b=1vWL9PvgJH1Q35WDAg/7TteLYVF5d9asNpc+M54Usk/lrTUEvcu3vYtAH7/+O4pOxcUh
	 uAuLQtplNfJLFwMvblH7eFfgPcp10pl3i2W76YtX0VHksPwMwIkbNNli5sEubNi1bGm19
	 518Jk5nFpBemGpH/wfDD8DR2fUisIOMn4NBTsOytQTkD0wiOllM16qTi0Ww/hajTfzmwW
	 VHtJo1QaifjY5F7TNbWzWxOCyr+Yo3krHQH7MiWcAju9uzLHhlE1qXjdGkuNYWo8M5HxD
	 asdYsCYMnS7c5kDCPOlPBkzBXNb48xt+2VTP2gJxrQlj+quU8sRSmhpNytlZMggr8Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013655;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type;
	bh=RVMrEyTfPd6L3DrmXBQ+EA71uekThvDl0bNGFGHSH8Y=;
	b=pdFI8ho3jO81gVnj9v+7d9kvt7TmW/OBCUJdHJvZWj4l69f6duVlQubuGwigWZdQHuRx
	 /mbER3Qcb98ouOD2niTd/3Sx2cfXa7e/qtGd7uVDz3dpYZQg0igUYQ9tiXcPn30XNaKtb
	 AraYQU9L7yL6nfylFh8d0HVJ7NXogKFhMsUdc46oCgryYOIUE8W7tiRPFl8bO5uAovsEz
	 jqE5hXrzWu9y8CbCGLcaVAlbG7sgQVkZwpHZTTbdz1tyIUGYoFApYsVMqVXYT58DBcluF
	 cl2Pin1L9EZf+soY1P6vXAqYGU+61d7/s+7S8dXdqM6SphtbH8fKiiNrCjVZQisQXVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	arc=none smtp.remote-ip=79.135.106.119
Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37521606A31E
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 11:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37521606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793013646; x=1793272846;
	bh=RVMrEyTfPd6L3DrmXBQ+EA71uekThvDl0bNGFGHSH8Y=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=LwL5VSvsK1xDlecepNPv/axsoHB6q8JkvAstkUXb39MjaRkd2kyPAThlNPT0wuMQv
	 Xbs4d2TH5GsojsmzWtiIcvmJbDjmt1WLqgnSGuzkNJTVDMmVJx+9Q7f8hw8LEW4Rml
	 A/hkigCz0ajJ1yyewvSH3vJVm9SRieZX/n5/J/+EFgvJPU5Q3TmAUOYcbP3kX2aNtp
	 a0MbVV4dDyowSs6kKo4joCT7VxY97sf/q/7Fxk9dLyVvNXZHpOANt+7WU53ePtg7Ug
	 cJqbZrVxkDramzCw+IpNjl2/ZO+BqKgdeG9Xo/B9HAxuZRqXAP10xKKmJf3C23iWDd
	 IoAsSQb98AHZQ==
Date: Mon, 26 Oct 2026 11:20:40 +0000
To: Egor Poderiagin <egor@crazyrussian.pro>
From: Robin Everaars <robineveraars@pm.me>
Cc: Oder Chiou <oder_chiou@realtek.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matthew Schwartz <matthew.schwartz@linux.dev>, Pengpeng Hou <pengpeng@iscas.ac.cn>, bui duc phuc <phucduc.bui@gmail.com>, linux-sound@vger.kernel.org, regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] ASoC: rt721-sdca: runtime resume fails with -ENODATA since v7.3, jack PCMs cannot be opened
Message-ID: <179301363708.752130.11323881261715222213@pm.me>
Feedback-ID: 201127006:user:proton
X-Pm-Message-ID: bff56b458c010fbe6cc66c08f6bf8b0a34853281
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------65f99b9543396eee2734472a3f36df622da95d9e568eb34c82109226620c8deb"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------65f99b9543396eee2734472a3f36df622da95d9e568eb34c82109226620c8deb
Content-Type: multipart/mixed;
 boundary=eb85fcef38c74adcd6507b38bec70231e0c3f098e0341a2c2f9807fa32c7
From: Robin Everaars <robineveraars@pm.me>
To: Egor Poderiagin <egor@crazyrussian.pro>
Cc: Oder Chiou <oder_chiou@realtek.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthew Schwartz <matthew.schwartz@linux.dev>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>, bui duc phuc <phucduc.bui@gmail.com>,
 linux-sound@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] ASoC: rt721-sdca: runtime resume fails with -ENODATA
 since v7.3, jack PCMs cannot be opened
In-Reply-To: <8a12a2d9-1b56-4e00-8ccc-cf31325f8366@crazyrussian.pro>
References: <8a12a2d9-1b56-4e00-8ccc-cf31325f8366@crazyrussian.pro>
Date: Mon, 26 Oct 2026 12:20:37 +0100
Message-ID: <179301363708.752130.11323881261715222213@pm.me>
MIME-Version: 1.0

--eb85fcef38c74adcd6507b38bec70231e0c3f098e0341a2c2f9807fa32c7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Egor,

I can confirm this on a second ProArt PX13 HN7306EAC (BIOS
HN7306EAC.310, same components string), running v7.3 on NixOS.

Here it happens at boot without any manual steps. The first open of the
jack PCMs, when WirePlumber probes the card about 14 to 20 s after
boot, fails with -61 on SDW1-PIN0-PLAYBACK-SimpleJack and
SDW1-PIN3-CAPTURE-SimpleJack, and the card is left with only the off
and pro-audio profiles. A boot with the stock in-tree rt721-sdca behaves
the same. v7.2.9 was fine on this machine.

A regmap trace of one jack open, with only regmap_reg_write and
regcache_sync enabled, matches yours: 12 regmap_reg_write lines from
202d to 40981300, then regcache_sync status=stop, and the open fails
with -61.

Your change to rt721-sdca-sdw.h fixes it here on top of v7.3. The card
is back on the HiFi profile with the speakers and the ACP DMIC, and both
jack PCMs open again. The module I tested also carries one unrelated
local rt721 change (a .remove callback
 that drops hs_jack). With it,
four s2idle cycles in a row resumed without any rt721 errors in dmesg.
After the first two I also checked that the card was still on HiFi and
that both jack PCMs opened. I have not tried headphones yet.

Tested-by: Robin Everaars <robineveraars@pm.me>

Thanks for the thorough analysis.

Robin

--eb85fcef38c74adcd6507b38bec70231e0c3f098e0341a2c2f9807fa32c7
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - robineveraars@pm.me -
 0x8B6BA132.asc"; name="publickey - robineveraars@pm.me - 0x8B6BA132.asc"
Content-Type: application/pgp-keys; filename="publickey -
 robineveraars@pm.me - 0x8B6BA132.asc"; name="publickey -
 robineveraars@pm.me - 0x8B6BA132.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCkNvbW1lbnQ6IGh0dHBzOi8vZ29w
ZW5wZ3Aub3JnClZlcnNpb246IEdvcGVuUEdQIDIuMTAuMAoKeGpNRWFoOGxaUllKS3dZQkJBSGFS
dzhCQVFkQWFSa3p2ZTQ5ckJFSk1LSkg3NDZSWEhZKzJmVDc3b3hST2k1ZAo4SnBMKzY3TktYSnZZ
bWx1WlhabGNtRmhjbk5BY0cwdWJXVWdQSEp2WW1sdVpYWmxjbUZoY25OQWNHMHViV1UrCndzQVJC
Qk1XQ2dDREJZSnFIeVZsQXdzSkJ3a1FIY1YvYThzR0dvcEZGQUFBQUFBQUhBQWdjMkZzZEVCdWIz
UmgKZEdsdmJuTXViM0JsYm5CbmNHcHpMbTl5Wng2VjVxUzg5dzdDRFlTSXNjNU54dVBKSTFyZ29F
eVkvdjhkYlAzSApxa29OQXhVS0NBUVdBQUlCQWhrQkFwc0RBaDRCRmlFRWkydWhNcmIyWHVqRm5G
akxIY1YvYThzR0dvb0FBQVpzCkFQOXpJS1d3dWJDbEZFczBKNmpwUUhUS1hGVHErOTlNUmtmREtx
SVRidW1RelFEL1IyT2F6VHA0b0NKTzJiT0QKTkZsaVZBbTh5WFA2QSs1ODZ6UjJZS3QwUkFiT09B
UnFIeVZsRWdvckJnRUVBWmRWQVFVQkFRZEEzcDVGN2I1TwpGc1dLclNXRW1FSGlhL29lN25vLyta
MVcwT1BmZllyRFB5OERBUWdId3I0RUdCWUtBSEFGZ21vZkpXVUpFQjNGCmYydkxCaHFLUlJRQUFB
QUFBQndBSUhOaGJIUkFibTkwWVhScGIyNXpMbTl3Wlc1d1ozQnFjeTV2Y21ldlVkUisKViszVWd2
SVZqcURMRk9XeXlHcDVoNEpYQVBmWVpzRC8vUkhndlFLYkRCWWhCSXRyb1RLMjlsN294WnhZeXgz
RgpmMnZMQmhxS0FBQm9GZ0VBOGU0ZVNMU2FMbXY4L2UyVzFMOS9WS0FiajJaN0pFUzZLQXBpOUJa
Nm5RZ0JBTmhaCkZoTUZ6c3l6dTJZWXRhQjhTWXRWdGhKSjYvZUlRVFQ2VWRRRUlZc0YKPVlLaE0K
LS0tLS1FTkQgUEdQIFBVQkxJQyBLRVkgQkxPQ0stLS0tLQ==
--eb85fcef38c74adcd6507b38bec70231e0c3f098e0341a2c2f9807fa32c7--

--------65f99b9543396eee2734472a3f36df622da95d9e568eb34c82109226620c8deb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmrfN4cJEB3Ff2vLBhqKNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmcZyz09Yry8k5txF9AgY7fhFiEEi2uhMrb2XujF
nFjLHcV/a8sGGooAAKntAQCE12WuMgR/UbHEYxzx4DH5v+0Ysh2a8e4abKyR
8duUPwD7B+YdmAr+EzePS0M9Vsxwba28VqgrPqaFy660JjmUWwI=
=cD6M
-----END PGP SIGNATURE-----


--------65f99b9543396eee2734472a3f36df622da95d9e568eb34c82109226620c8deb--

