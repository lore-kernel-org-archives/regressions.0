Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11E42569;
	Sat,  1 Oct 2022 11:34:29 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oealH-000481-Ae; Sat, 01 Oct 2022 13:34:27 +0200
Message-ID: <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>
Date: Sat, 1 Oct 2022 13:34:26 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US, de-DE
To: "Artem S. Tashkinov" <aros@gmx.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <9a2fdff8-d0d3-ebba-d344-3c1016237fe5@gmx.com> <YzgY9X/DM9t/ZuJe@kroah.com>
 <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com>
 <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info>
 <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
In-Reply-To: <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1664624069;05aca0f3;
X-HE-SMSGID: 1oealH-000481-Ae

On 01.10.22 13:21, Artem S. Tashkinov wrote:
>
> Lastly "unsure which it is: just try your best guess, somebody will help
> you if you guessed poorly", so send a message to LKML 

Read the quotes in context please, they don't tell people to just send a
report to some mailing list, as they tell people to chose a subsystem
and mail its maintainers (with lists in CC).

Is that perfect and will in work in 100% of the cases? No, definitely
not. Would it be good to have a a kind of first level support group that
can help in this case? Sure. But we don't have one right now. I sooner
or later hope to work towards forming such a group, but there are other
things that are higher on my todo list for now.

Ciao, Thorsten
