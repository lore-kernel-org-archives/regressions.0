Received: from mout-xforward.gmx.net (mout-xforward.gmx.net [82.165.159.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441597C;
	Sun,  2 Oct 2022 20:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1664741988;
	bh=7r7zvvB9gG8XwV83HzccWZ5B798pnJP1xaPdpTsVtNs=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=N3NkAX7AWFWQz8IrkHng/2Kb5rRTvBjnQAXtrwd8iJbYCpAYcbw+httPog+SzYTkC
	 df755ivhraWp1Hi0Cz8R+vEROTrGstE1sp8GJiUFsd8jPldJ0lnXM/nECvivCPBFmD
	 BZJSuoGQBlvcX32kRECFgByUoGII2ngyddjOONbU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.13.110.23] ([143.244.37.73]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1M89Gj-1oawZk45H1-005JGS; Sun, 02
 Oct 2022 22:19:48 +0200
Message-ID: <68170af3-1692-affc-afcf-77a3f574ac3c@gmx.com>
Date: Sun, 2 Oct 2022 20:19:44 +0000
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Thorsten Leemhuis <linux@leemhuis.info>,
 Greg KH <gregkh@linuxfoundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev, Mario Limonciello <mario.limonciello@amd.com>
References: <9a2fdff8-d0d3-ebba-d344-3c1016237fe5@gmx.com>
 <YzgY9X/DM9t/ZuJe@kroah.com> <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com>
 <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info>
 <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com>
 <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>
 <Yzg7pHspc72I7TAb@mit.edu> <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu> <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <Yznti0ca4g/hsm/T@pendragon.ideasonboard.com>
From: "Artem S. Tashkinov" <aros@gmx.com>
In-Reply-To: <Yznti0ca4g/hsm/T@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/8ZKPdBic0WSFQN3mubD2g8lwdSg1rhozq1ikht6aNQdWNWdnUF
 1BbOtHmvvvCLbtGd1hVeR617ipu3EAcsNtw+DS2zIgGRadNf3NNmzGdiAnod8/uO3YC8aoL
 oCS2abUo0cfEQQwBClM29oAMNUPvHocRH8ljXLuM0fRp97fiQinDSR9yMJMQpWInQH0RRPS
 gOg0VS+cXwuwCB1Duaq1w==
X-Spam-Flag: YES
X-UI-Out-Filterresults: junk:10;V03:K0:P8rj4hUUsgo=:Vn7Gn1ZaihZ/a8+XzJfQ0G7p
 igmKbp/WT3mydKenaPtQvqvaK+ai2NREch/ZG5EczR0qmKl39oOJI7UUgfPeA6Sz+pGmn/Qwl
 vltqAorqqfbu6XMi3Y4mpQuTOPZdvwLqEux2OqV4rXhJjhTx09q/aqhTob2jKnK8U3KXp6k64
 SaZKG6Uv/vmTV8sz9BVgqtNLNDkKGtQPYV1vma3JyU98nXPZKMeGUMLWplj6SfhwtApcp4SEh
 Lhzs8tnkDr0KBqA0r0nTQ8sP0DlGUmdYakjiSimk6tWE1tVqPT8cbO4XlI1r4xWFdFKdJ4J8C
 HnUrsCwZ5zxxaBLC7mN1NpZ5CkBVBt9JA2yzVZ2L/kobsEF6yoy/bRdI9Jd7waK2fcJAk93c6
 04/bzFN7mW5njRAwwn55wxXtRgi0pi18yVVnPtUsZ9DAtns9ugCJpsLlY3XFVSIDB0asSeyi+
 rjZlXTNZUUJHiEJ+eyvWXLVjThxyQRoYX7xL9Hh3WiXw8q7AuNp4Qtl0SvCYs/FtQ2u07Njel
 Wr2h9P7ePTQg8wW2QTRDKb2o0VbfrVasczy+3eEZArbGWZDY8bcoUKAU5aGTSFdS738/xIQJz
 atbjTidTvIULzn3AVEOHnvzud7ZwbraNSrZvEaqpDiVAGedDasKcf+LF3+QIAiFzQEUXKh0Om
 /r/hShOJduhUt78pAnxz6RCWfb3Un0uqyvJWPy9iC9V+kIOZYT4VIR8mFU6zCSvc8l1FWM4X4
 DBtbUVTbyxLIyJCqldT1Utv/rX+uLZ9LLr2JhPVnRpY5WZ0smvT0a/VhkvByU/lGEKxniKrIE
 MbPO+Zl+dpdtat10H5vSNzWAErhT+E5LXktsUXmJepaDfKFspW4XfNELLvIPj/ikQE9b3qvZP
 PuZ7ZrrgtSDudeEIlNy1mYEPLX9UFady00PuPkevEiZ/edlV7/cTwzowofNeO6RdYbCb5/DBL
 Hgn+vwTxhQ0nEy5SEqQSjWb8UJaYNAizUPa9uDwq9FkJxhLNDljMehH3GOsgOBQn0O/6v2SEo
 FYVDM6xFe6fPL+sC0WnPCnDUSCkW3Hx9sZn8nXadgDj/sUrXF19HSZE4MOmuxl3s0Gon22TJH
 ibunOMBRLwowmivZ7bjL7zNY/QTFZBpK8D7nx9uGu9dop90uPF13myx331dnfdqhi3jk2irAO
 e98Jx5MNBMZxZ7Ldk7xDd6XBdk0F/44o+XX/GNAeu72lSg==


On 10/2/22 19:59, Laurent Pinchart wrote:
>> Let's subscribe the past six months of developers using git commits and
>> if someone doesn't like getting emails they go to the website and
>> unsubscribe _once_ which takes a minute. This is a non-issue I've no
>> clue why we're dwelling on it.
>
> I'm not sure that would be legal, at least in the EU.

1. That's already been done at least once AFAIK.
2. I'm talking about emails in public domain (git log). It's not a
special forces operation to exfiltrate an email database.

Regards,
Artem
