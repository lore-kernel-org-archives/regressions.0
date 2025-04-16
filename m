Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3531EFFB4
	for <regressions@lists.linux.dev>; Wed, 16 Apr 2025 15:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744815708; cv=none; b=G1ZLYfO1xLMki8oTdfDcl24ipDqqPgAY3nKKE7ST8Sjid9jXfi6g4ulEets6WCbpC1sGaasB/+KiId6xEngT04bTQmKjz6eplYpMXUsj06Pn669twCjVBTtG6OswvFZGOsG1nlXMZV/OJjDyqms0d+pjHTizRu80TKS/2uJMI+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744815708; c=relaxed/simple;
	bh=7Axh52coiOI0JKbFKrbXVFHvbqfMz5ZjGnycArF5irU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i5Z1msNOrLX/l3+/5wFUz334LNLN5Ux0VjTVzeRHiq2V2vZCf1Y5WO16wIPG/OR5GO5U/9tHmGo2ZpIQSjDZ1yRNqBj74I5hEFEdH/WXeVUdALJ3N0b11kbfPJSk7l9ndMQKl7MiML3ta6KAKGU3J1VwhMZWUftTJ47dSsplyrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=MuAczNf/; arc=none smtp.client-ip=212.227.126.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="MuAczNf/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1744815702; x=1745420502; i=christian@heusel.eu;
	bh=tKvDn5Ua0J+JdrBJCtSOPWhyIypPlWKpqTtOxhNcG2E=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MuAczNf/jRc5kXG9MyTqpSxpWBIIITz9vKzs/vPtZxjrp6dsceEPyQqPPVcwqv+w
	 W9LPJinvYO71HElVYVaqrThyCOb+WXd2G7rH1PryCH5B+ZaX8XbcpRVkwvRFqv3Ts
	 +X3G4HcrxumcMF9HOJ2FFo3lNtSTBiQeLhA6hDEnVeU/uH+dbI/jdtQuX1qO6nyCx
	 IwisSsK86iDyT2MYvOWuCGtKdnhGRjDOyE6aRUE3N6nZVpZqMK6CfeRAKj1ge09BT
	 b/HkjtJvbs3BKpdL+04nDTN5n9fMl/H+fF0TO8G87r/uwxZUJL+9NyS9rfDnj2Dl6
	 KfB/fT3ssTN0UGvhoQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([80.187.65.171]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M5wTr-1txbQn1gQl-00Ahgn; Wed, 16 Apr 2025 16:15:46 +0200
Date: Wed, 16 Apr 2025 16:15:40 +0200
From: Christian Heusel <christian@heusel.eu>
To: ubomir Rintel <lkundrak@v3.sk>, Jakub Kicinski <kuba@kernel.org>
Cc: michal.pecio@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: [REGRESSION][BISECTED] USB tethering broken after 67d1a8956d2d
Message-ID: <e0df2d85-1296-4317-b717-bd757e3ab928@heusel.eu>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dpdgofzlybgncae3"
Content-Disposition: inline
X-Provags-ID: V03:K1:M1cGX4HvEWB6CveN0yndWMzqbLMNgEtlLw4dlX+1LMpDNhPo/3U
 h97aHpaX2K068ENHwSRaQ+VmNPOjAVTnOXbKzbcbGhZEwIw4hnVzz1VvEk1yBA9yRu4jxdP
 MRwHAKr+nEv0ynx2HoldplTwkSiMWf8wBxk7A40kVDADeLnWJt9mAORhS+xWG/caHmAHxE9
 mrlkIWU4Dfe34gk3liLaA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zcHF0XfRSfg=;48aCcoWSuChTaY6x68XP6z0fEuC
 anYCojtZqEj9toFgrmqbBEpGTVM5XXL6bcVGBeEudr30/VckMgwYJLxoIPJVuM9CZjjCHTSdJ
 Ds0H/W8fiZK48qNTMkgyqx0YRlHHMxeYA4Uqu+F8AL86IM8KhqWnE6kWJXnAUCOHFWvvpdkEo
 sV8VBmoHoNCrGcc+mj+QridjkILzX3M618PGCf6cD6zNMzo8+/ybt1AWV3XYKRBYlEjE5SGas
 U5qBFONgkp+/l1tbK7OUh/Ls28K9iFa1PtF0z1dVbKxdA9Fa4FMm7rWSTz+boM7nE8jBuTY7e
 A7xIUkBXZon6UqLdB5DY98LdUMc9v4KpsLt91iOAVBHM7A+0sj4mGQlWb0g4+oc5hQftRMgOo
 zHrlslJ18D2m0PSgqudF7gO1mTa8cISpgK5+PTfB16w0H984txTShIAnvxo+5dBs3TV5nIGSh
 r5I9EXnkYfTO59KDnoYFJxv3Dvl5mMm2VNjFWoVhZfHJJJgC9m1gsXZ7POoeLivXecmKMc/5c
 3qLVj/Ub2kB1O9WZ2qwcOc2aPbOTfnnka90JyGs4HmDIY2eQVAKKjlOqxQPAQCThE3KQCSLgB
 uQcGct1ew0Cnk7SU6df8WEeKVXHKqY7n2K4ZyjgIlIfbJkkmgBoW4vkB4FnFOi7YieeQfJ4yC
 6jzaZiB0sIuWFydG2QHex4fvKwT5rsTGlMQ2PZ7vzYUow+EqAImqt7JQyKax1/EqyoS8cSbc5
 A+Bre9QAUO9PstYfHNXTh5m4ZH07pgL59BMqIrGdZFLfvmgfYMoCVUwpCt7KyPK1U2JMdym8/
 NGMLKrC+hiUPHObWn3rO5er60HJFobCwGXteP10BmR4+WCWzZJ2ZZqjU52qmDQjNaVdERPGHk
 DridOVNgbErFKkXQU6eDmIXIYw1e9sQLeq+9/I9B5MyQMN7eD2Hh/24oCdEnDcfUs/BZlsuhE
 hcrm0EKnWjuml9Yx+85g855RvrA1wqU2knjF1FwDCV1688pDRvWyB0K+LGU6dxDtFiHKCeXdL
 cDX0stT1TnPPOfyfLNihGecWdSAyMklvzn4MJm04E4ltmzh25e5rfmfYMfhRG7ws19/TLu3ps
 E85+toChAGLm0ZRpfuprF8mAxJ5xsMDayoWKIruA/mnKr54RRa1yNaZIh+bnWpHvoeW8yIxGq
 LawlNYZrKz9RIOOitFJ+C1IHpLvHZiMTgiVdHaDRSEvlZ+g2E+K4Ckn2Cjhx3Rbe6UDVMTTdg
 IuGNCEwMeHtSQg5G2AiaH1Q32wt/amNWCVPSi+je0bGr/qYMIdSc6CSxNsbP1Xp/6wVBi8YOJ
 MBXBvVYBhAK6+z9HVJLL8XNneKFqHbmV8QvlRpYSh8xdeuJf3G0ogNR6wPOa2usWkp18FLPam
 QoeTU/76PreeH8I7JtAtSxTbbbf10vL8jjc+Y=


--dpdgofzlybgncae3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [REGRESSION][BISECTED] USB tethering broken after 67d1a8956d2d
MIME-Version: 1.0

Hello everyone,

I have recently noticed multiple issues popping up in the Arch Linux
Support fora and in the Gentoo bugtracker (see links below) where people
could not use USB tethering anymore after upgrading to 6.14.2.

Micha=C5=82 Pecio on the Kernel Bugzilla eyeballed the issue within the
mainline kernel tree to the following commit (that was backported to
stable):

    67d1a8956d2d ("rndis_host: Flag RNDIS modems as WWAN devices")

The error is still present in the latest mainline release 6.15-rc2 and
reverting the culprit on top of mainline fixes the issue.

Also the issue (as stated above) is already reported on the Kernel
Bugzilla but it seems like none of the actual developers has spotted it
yet, hence I'm amplifying it to the mailing lists.

I have attached a dmesg output from a good boot (6.15-rc2 with the patch
reverted) and one from where the failure occurs (regular 6.15-rc2). I'm
happy to test any debug patches or provide more information if needed.

Greeting,
Chris

---

#regzbot introduced: 67d1a8956d2d
#regzbot title: rndis_host: USB tethering broken
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=3D220002
#regzbot link: https://bugs.gentoo.org/953555
#regzbot link: https://bbs.archlinux.org/viewtopic.php?id=3D304892

--dpdgofzlybgncae3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmf/u4wACgkQwEfU8yi1
JYUweA//fIBxW7+VlDgryoJTXkcwMN+yqBtXA5y6rbEGziJlPoTkPscIY1WxKCge
DmGmuExalZTmOKJrECUgpg1bvDOt+ykXcZuih058lgSUwXGcijDww7m1+rEcRjQ7
WMenwzpEtK7EQ1hgVkm8dxrHW2XjDDT4rrm18W/Ne0KDoUzfvAUP1xqnF6VJ7H7u
tB2F5lEhN2qHq7Ax9+Fh3Rb3BcNEn/niz0tysMn2FJTSXFujDaTcuUUqh9Kfrq3a
i2OM4cPE9kI2IO8yka2s5W5Z16Srl0Y+ljXo3shjiNoUV1CPRlJen+3PYuT2xfq7
iKLqEBkrbTep7SfNpDSKiDvt2LsNy3uJePXtMyzLkt9wV7vnhs2J5Dq5Wt7EpZV0
NjfTCWx8Syl/YbL1NqvwIoZn5D3eVWprdVz24b6rZf4dRK3itBnFG9uRt4LBN4aZ
bfyWxIpCkIyEBLiqCfgrl/ya57rto0rvrY4PUuFDIyuVfdQhkrk9SASQ2gxt2TPE
K4CJkMbBteYzRlkBSWokJPL/EvU1C9cCIo90K8QH35wGUYcTeV8d84tcEfNKgxES
SO4yTWlG7Sh4w8pimjQsNGvLN+IXoVo1ZZRJik7Y6bpBLjHZqdOhblHoQwiYGxrp
edj/rbJnGDH/bfLPyXvwS4rR/bEUAwiyTIUlGgT4V3y9Fkfg6aA=
=JY64
-----END PGP SIGNATURE-----

--dpdgofzlybgncae3--
