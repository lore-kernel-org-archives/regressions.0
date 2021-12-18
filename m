Received: from u12.atthost.pl (u12.atthost.pl [185.255.40.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFC52C9C
	for <regressions@lists.linux.dev>; Sat, 18 Dec 2021 20:45:04 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
	by u12.atthost.pl (Postfix) with ESMTP id 8A59D634AC;
	Sat, 18 Dec 2021 20:39:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at atthost.pl
Received: from u12.atthost.pl ([185.255.40.32])
	by localhost (atthost.pl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ANJuBeLBD5iv; Sat, 18 Dec 2021 21:39:27 +0100 (CET)
Received: from dell.localnet (staticline-195-234-21-179.toya.net.pl [195.234.21.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: tomasz@cebula.eu.org)
	by u12.atthost.pl (Postfix) with ESMTPSA id E19AE63809;
	Sat, 18 Dec 2021 21:39:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 u12.atthost.pl E19AE63809
From: "Tomasz C." <tlinux@cebula.eu.org>
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Thorsten Leemhuis <regressions@leemhuis.info>
Cc: tlinux@cebula.eu.org, linux-input@vger.kernel.org, "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: FWD: Holtek mouse stopped working after kernel upgrade from 5.15.7 to 5.15.8
Date: Sat, 18 Dec 2021 21:39:25 +0100
Message-ID: <4366861.LvFx2qVVIh@dell>
In-Reply-To: <fc7e6040-b760-02f1-57ef-71aa4b88aea6@leemhuis.info>
References: <e4efbf13-bd8d-0370-629b-6c80c0044b15@leemhuis.info> <42903605-7e8b-4e84-fcd6-1b23169b8639@redhat.com> <fc7e6040-b760-02f1-57ef-71aa4b88aea6@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Hello,

I haven't had time to test it yet. But I see that another ArchLinux user ha=
s=20
compiled kernel 5.15.10 with this patch and confirms that the mouse works.
Details on:
https://bugs.archlinux.org/task/73048#comment204441

Is this enough for you as a test?

=2D-=20
Tomasz Cebula
Dnia pi=C4=85tek, 17 grudnia 2021 09:37:11 CET Thorsten Leemhuis pisze:

> Tomasz, could you give it a try please?



