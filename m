Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E15EBE2
	for <regressions@lists.linux.dev>; Wed,  9 Nov 2022 15:42:20 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1osnDQ-0000Uh-Cx; Wed, 09 Nov 2022 16:42:12 +0100
Message-ID: <7c5bbff7-298f-b38d-9409-3e8efef82619@leemhuis.info>
Date: Wed, 9 Nov 2022 16:42:12 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [REGRESSION] Bug 216493 - Panic on __kernfs_remove (probably
 after 5.19.8)
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <c38235e9-b620-510c-4b53-6b190b83f997@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
In-Reply-To: <c38235e9-b620-510c-4b53-6b190b83f997@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1668008540;befcb392;
X-HE-SMSGID: 1osnDQ-0000Uh-Cx

On 19.09.22 11:56, Thorsten Leemhuis wrote:
> I noticed a regression report in bugzilla.kernel.org. As many (most?)
> kernel developer don't keep an eye on it, I decided to forward it by
> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216493 :

#regzbot invalid: Patrick can't reproduce the problem anymore, Igor
didn't reply to a status inquiry
