Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354E9139C;
	Fri, 30 Sep 2022 16:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1664555650;
	bh=3zWxdH8sXT33FbMc4doFfyvYiySHCK+56G14z1qLRwU=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PcF+bMpchmAH6+VCT2UI4htW6DEO7SQQ82sziJ9u/9uttPLHYRqGpl93z487H8bZ2
	 Oov5YOlyoWAsZtS3tCqvxnRXs2PeNVqvpMZj50xVaEfM0zX0RWkefX3ak/W6ZZqlWV
	 PO19Qma2PZ9zSDoxhBJPm8LUebDQMtJE9IXyXZj0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.252] ([5.166.161.56]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MpUYu-1p1YNS2MMW-00pqlM; Fri, 30
 Sep 2022 18:34:10 +0200
Message-ID: <3cfaef48-744f-000f-1be5-6f96d64dea24@gmx.com>
Date: Fri, 30 Sep 2022 16:34:08 +0000
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
To: "Bird, Tim" <Tim.Bird@sony.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thorsten Leemhuis <linux@leemhuis.info>
Cc: Slade Watkins <srw@sladewatkins.net>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 "workflows@vger.kernel.org" <workflows@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <93a37d72-9a88-2eec-5125-9db3d67f5b65@gmx.com>
 <20220929130410.hxtmwmoogzkwcey7@meerkat.local>
 <7b427b41-9446-063d-3161-e43eb2e353f9@gmx.com>
 <20220929135325.4riz4ijva2vc7q5p@meerkat.local>
 <95c3384b-53d0-fd6c-6ec5-a7e03fdeddfc@gmx.com>
 <F300ED64-5E8E-4060-89DC-C98BC5FF08E6@sladewatkins.net>
 <YzXK6Px+BrNuuMZH@pendragon.ideasonboard.com>
 <a86adc6d-05db-ec2e-c5de-d280aad9fb8a@leemhuis.info>
 <Yzbtuz6L1jlDCf9/@pendragon.ideasonboard.com>
 <BYAPR13MB250377AAFCC43AC34E244795FD569@BYAPR13MB2503.namprd13.prod.outlook.com>
From: "Artem S. Tashkinov" <aros@gmx.com>
In-Reply-To: <BYAPR13MB250377AAFCC43AC34E244795FD569@BYAPR13MB2503.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kse/28aPLtGmqGjjXZgR1b6Qfc3LOQrx3vRwvnNBr8/KW22As4+
 lIggKreAYdNcT1+7zc+DsXGRcZL1Uu/O6c/z3L/Cq4rmKbkSvR1OmJkEZ+bi1t4VF8s1znC
 steXm60GQjttlJcUHi64dBSKvfEAUylTqQPcKq34/JhUswbJisKNuqQMhkoOCmU9JQkRJtU
 k8lW6M5zFjkCrJi6y+Buw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oO6iha8tZbM=:mufWOqKYMfiWLCeAKGBbos
 HVL+Oy4hsVhEL24MMd1yATAxLWZN4SgdDMZB0DQ+LulP6l28k5ClbbGVmwmimL/BiBL3XWrNQ
 dig8Y9ZLjId/zNFoUyGZZ3kJ98NntljuoQwk6yY/Nye46wLBP7cWf4D1h7W+BvUhgbJfKr2U8
 +0XP3sr+0cRvlA7hx7as3tEP3a35gQVGkoGmtzAo0wsrwCn2WnDnnjJeinICQ/usTZagSHw/K
 mwkdUjuBxNOt27FlBpNpQkro2YRR0sjsKjy9WRi5Ojs786WUQ2l4c5bas54JUNsE9Rk8tXS0z
 XrKhiDyajqs9EP0e5XrLvPZ0JBcn8El0TmA7Lilk3bUoLTPk9EDE6oyZ9ehKkykaVhEsdjo8O
 wpJ3L6ttapxW4L0pMjNG8iWsZ9szQ7f5onjSI/1Yio5XXf+ArGJTX4ea8i+FQQRZy/8/1Xv4o
 CLZYTPkX/blOSdgtrGT3sf97PvHejfvtBAXopU2U3j3uw11imk8GfgLSkQqsrwIV2A1HWyPEm
 zAxMqK9Lwq54g0zzpRUcliudV1pJkoTC6+342E6bJGuCEYwEvjf/ghOQ+s3bINHqpGKYwLUGg
 uEPB8m+0egvNEDJuMsCpWwJYOGiTA3UaPVMSISeRqyuy5Pxpt1WuTYlJRPhzobFe+BUHfunnB
 4UtFXXIfmLWDAEx+GqNsyk/dDzo89+e/PW6SLuCeQ/TNPFTblv8bzomGLIRf7RHdK66bXpQyp
 SSnt0IzJ8fVYgrpmjf3ZkaQdrN8/xRPam8S+mpAIbKOUmsYg897qsOs2mqjPPsiVNXsM9aKWZ
 Fl0Dabk9tbPTn01x0Ao5Ii4RTaZ6Z0jqH4QGP4wjsWMvEXBWqJcCt9PSztU0DFRs8KUUt6Lvy
 sJORGLV9LCCh6qVgOHn21VUVq6tVoVpT1/4IHZoiatMONIB5ngXleq/sbrpWVrOs19ROpOywd
 r7Ak31BiviD9Jp62xCP1wZH0glrNgrrnbprSjTwYbGJi1QAHa6mpIljMifVNYk3MU1IQzUfik
 dh9hMm7KPXd+Qanp03SYdR3+dcK0aW5KS4KVBk8Y60xrYs8R5yB7TgdoXWvS8p9vLHXlDN1la
 /SoEFi7a2L8HgB7/qExUEJwlED2krmVR5zlQaKpze6Y5iijBNDiU+hzIMKSJ/lX92MjOUpWG+
 vHwjE+8a8nDLnc/IV+n9erD3JD

On 9/30/22 16:19, Bird, Tim wrote:
> E-mails sent from a web interface could have as much structure as you'd =
like.
> So one avenue would be to set up a nice interface for bug reporting, tha=
t just
> delivered the form data in e-mail format to the proposed bug-receiving m=
ail list.
>
> Also, if an e-mail receiver (something automated) gave a quick response =
on missing fields, I think
> you could quickly train users (even first-time bug submitters) to provid=
e required
> data, even if they're sending from a free-form e-mail client.
>
> Just my 2 cents.
>
>   -- Tim

Debian uses an email based bug tracker and you know what? Most people
avoid it like a plague. It's a hell on earth to use. Ubunutu's Launchpad
which looks and feels like Bugzilla is a hundred times more popular.

Sometimes programmers have to realize that most people around are not as
smart as they are.

Best regards,
Artem
