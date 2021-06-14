Received: from 6.mo179.mail-out.ovh.net (6.mo179.mail-out.ovh.net [46.105.56.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BB772
	for <regressions@lists.linux.dev>; Mon, 14 Jun 2021 09:23:31 +0000 (UTC)
Received: from player778.ha.ovh.net (unknown [10.110.103.168])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id DE5C719C342
	for <regressions@lists.linux.dev>; Mon, 14 Jun 2021 11:03:46 +0200 (CEST)
Received: from zegrapher.com (static-176-175-108-40.ftth.abo.bbox.fr [176.175.108.40])
	(Authenticated sender: adel.ks@zegrapher.com)
	by player778.ha.ovh.net (Postfix) with ESMTPSA id 3CB821F24F971;
	Mon, 14 Jun 2021 09:03:44 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-102R004c63f1684-746c-421c-9661-91e17fa95fc5,
                    946D958682469A78D70B9269846191D1BA8514F5) smtp.auth=adel.ks@zegrapher.com
X-OVh-ClientIp:176.175.108.40
Date: Mon, 14 Jun 2021 09:03:41 +0000 (UTC)
From: Adel Kara Slimane <adel.ks@zegrapher.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Message-ID: <b56d3d96-70d6-4ad5-9b8f-9b6fea958ad7@zegrapher.com>
In-Reply-To: <YMbmeRH38Wp6BHPf@kroah.com>
References: <d086de2a793eb2ea52acb11ed143675c@zegrapher.com> <YMbmeRH38Wp6BHPf@kroah.com>
Subject: Re: Kernel 5.12.10 and 5.12.9 freezing after boot-up with while
 sound output is looping
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <b56d3d96-70d6-4ad5-9b8f-9b6fea958ad7@zegrapher.com>
X-Ovh-Tracer-Id: 1977643188722636661
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedvhedgtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffkjghfufggtgfgsehtqhertddttdejnecuhfhrohhmpeetuggvlhcumfgrrhgrucfulhhimhgrnhgvuceorgguvghlrdhkshesiigvghhrrghphhgvrhdrtghomheqnecuggftrfgrthhtvghrnhepuddvgfevudelveeguedtkedvjedvgeevgeeigeeihfeglefhvddtgeffffegtdeinecukfhppedtrddtrddtrddtpddujeeirddujeehrddutdekrdegtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprgguvghlrdhkshesiigvghhrrghphhgvrhdrtghomhdprhgtphhtthhopehrvghgrhgvshhsihhonhhssehlihhsthhsrdhlihhnuhigrdguvghv

Hello,

Yes I can, I will do then report back. It will take me some time as I only =
know how to do it manually.

Thank you for your help,

Adel

Jun 14, 2021 07:17:59 Greg KH <gregkh@linuxfoundation.org>:

> On Sun, Jun 13, 2021 at 08:19:37PM +0200, adel.ks@zegrapher.com wrote:
>> Hello,
>>=20
>> I am encountering an issue where my system freezes entirely after a rand=
om
>> but short time after boot-up: the computer does not react to any user in=
put,
>> be it mouse, keyboard or plugging-unplugging peripherals.=C2=A0 The imag=
e on
>> screen remains still and does not go black. Any sound that was playing a=
t
>> the moment of the freeze loops indefinitely with a period of around 1s. =
I
>> have the intuition that the issue is sound related because of that.
>>=20
>> Some additional information with this issue
>> - Only happens only with the latest stable releases of the kernel:=C2=A0=
 5.12.9
>> and 5.12.10 . 5.12.8=C2=A0 does not have this issue. I have not tested o=
ther
>> kernel version, e.g. LTS 5.10 , to see if it's a change that got
>> back-ported.
>=20
> Any chance you can run 'git bisect' to find the offending change?
> That's the easiest way to fix this up.
>=20
> thanks,
>=20
> greg k-h
