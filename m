Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6EA111E
	for <regressions@lists.linux.dev>; Wed, 26 Oct 2022 12:40:07 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1onfhV-0006np-6n; Wed, 26 Oct 2022 14:40:05 +0200
Message-ID: <156c9646-2cf6-ad32-56a7-d16342e87352@leemhuis.info>
Date: Wed, 26 Oct 2022 14:40:04 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [REGRESSION] Unable to NAT own TCP packets from another VRF with
 tcp_l3mdev_accept = 1 #forregzbot
Content-Language: en-US, de-DE
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: netdev@vger.kernel.org, netfilter-devel@vger.kernel.org
References: <98348818-28c5-4cb2-556b-5061f77e112c@arcanite.ch>
 <20220930174237.2e89c9e1@kernel.org>
 <1eca7cd0-ad6e-014f-d4e2-490b307ab61d@gmail.com>
 <d6c3cd78-741c-d528-129a-cf7ed7ef236d@arcanite.ch>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <d6c3cd78-741c-d528-129a-cf7ed7ef236d@arcanite.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1666788007;917e8db7;
X-HE-SMSGID: 1onfhV-0006np-6n

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]

On 12.10.22 14:24, Maximilien Cuony wrote:

> So we will try to not to have to use tcp_l3mdev_accept=1 to make it
> working as expected.
> 
> Thanks for you help and have a nice day :)

#regzbot invalid: tricky situation, reporter will work around it

