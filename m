Received: from premium237-5.web-hosting.com (premium237-5.web-hosting.com [66.29.146.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D816C17C1;
	Mon,  3 Oct 2022 11:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sladewatkins.net; s=default; h=To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uY/FTuzgD5ZBJtXcZdlV+dYNviUu9lySaYt57vkBpAM=; b=HxgaRZaFi0NHZRJ2Mma4fFLfYc
	Xru4Bz9cgJNQBvfWo4J4v2rcCzCfF8vih+6Dj1x/ujpHzxwoZ9I9Nvu0ccXSW+BJ72Il4CKepWgdq
	8AhBn4HUPuTf7R/W/I6jAeybfqKGTX8FjTom9KG9iDI4y5yiQRi90Ju2Q+rmY3m+ayVdUvDtfAduP
	0UwK/YKKVWcpBwNwsf7rRsPSJOKJzbaC+WD6QYyY6sRHE8E+qN8fkGiSFpHL8fO6lp+ERwlW+j+Jn
	MPEmj/drylrKe3bMy4YXizJLDeXXtUm7wHyDRH1Od/f3PVnn9dWms6yMJ8CB8iwZxvwwHmXOvXGMF
	UMErj/kw==;
Received: from pool-108-4-135-94.albyny.fios.verizon.net ([108.4.135.94]:56618 helo=smtpclient.apple)
	by premium237.web-hosting.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srw@sladewatkins.net>)
	id 1ofJTF-007b4C-FO;
	Mon, 03 Oct 2022 07:18:49 -0400
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
From: Slade Watkins <srw@sladewatkins.net>
In-Reply-To: <63a8403d-b937-f870-3a9e-f92232d5306c@leemhuis.info>
Date: Mon, 3 Oct 2022 07:18:46 -0400
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 "Artem S. Tashkinov" <aros@gmx.com>,
 workflows@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <534EB870-3AAE-4986-95F3-0E9AD9FCE45B@sladewatkins.net>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <63a8403d-b937-f870-3a9e-f92232d5306c@leemhuis.info>
To: Thorsten Leemhuis <linux@leemhuis.info>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - premium237.web-hosting.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sladewatkins.net
X-Get-Message-Sender-Via: premium237.web-hosting.com: authenticated_id: srw@sladewatkins.net
X-Authenticated-Sender: premium237.web-hosting.com: srw@sladewatkins.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-From-Rewrite: unmodified, already matched

Hi Thorsten,

> On Oct 3, 2022, at 6:10 AM, Thorsten Leemhuis <linux@leemhuis.info> =
wrote:
>=20
> Thing is: bugzilla.kernel.org is there and will be for a while, as it
> provides services that some developers rely on. And it has some
> problems, as widely known and outlined in my mail. Reducing those for
> now by performing a few small changes (aka applying some band-aids =
here
> and there) as outlined above IMHO is worth it to reduce the pain. =
There
> was no opposition to that plan from Konstantin or core Linux kernel
> developers afaics (please correct me if I'm wrong), so I'll likely =
start
> working on realizing it later this week, unless I get "no, please
> don't/please wait" from those people.

With the band-aids you outline in place: do you think it would it be =
beneficial to have a liaison holding users=E2=80=99s hands through the =
process, _then_ triaging to developers by contacting them with the =
information they need? (This is something proposed previously on this =
thread[1], and something I=E2=80=99ve already said I=E2=80=99m willing =
to do[2][3].)

IOW, someone to bridge between end users and developers and (at least =
try to) help bring some order to the chaos.

Thanks,
-srw

[1] =
https://lore.kernel.org/lkml/20221002141321.394de676@rorschach.local.home/=

[2] =
https://lore.kernel.org/lkml/DA4EA2D8-0EA0-41FF-B495-68EC9E92CC30@sladewat=
kins.net/
[3] =
https://lore.kernel.org/lkml/B0853C40-C19A-46D0-B151-84C9016745ED@sladewat=
kins.net/

