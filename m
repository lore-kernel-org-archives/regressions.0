Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD7029CA
	for <regressions@lists.linux.dev>; Fri,  1 Oct 2021 08:24:18 +0000 (UTC)
Received: from ip4d14bdef.dynamic.kabel-deutschland.de ([77.20.189.239] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mWDq4-0007tf-D3; Fri, 01 Oct 2021 10:24:16 +0200
Message-ID: <d4405cdb-95ee-1dd9-6957-502269feb15e@leemhuis.info>
Date: Fri, 1 Oct 2021 10:24:16 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-BS
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <bff7d309-a816-6a75-51b6-5928ef4f7a8c@exuvo.se>
 <20190927080303.GA7667@redhat.com>
 <CA+GwT0B5SyRZnGLqwqOeuJK4CWMVc=dKaWre9VN8KQC6kBzKGw@mail.gmail.com>
 <20191203075736.GA701@redhat.com>
 <d74dab51-3a84-9035-d89e-ea8f63e89198@exuvo.se>
 <a8eeb0bc-95da-291a-7fb9-5d15d1174c27@exuvo.se>
 <c22673af-40e0-3af2-5ab7-69b23fc03598@exuvo.se>
 <f935dc15-08bd-2e28-fc1b-b27634c618be@exuvo.se>
 <87czop5j33.fsf@tynnyri.adurom.net>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: rt2x00 regression
In-Reply-To: <87czop5j33.fsf@tynnyri.adurom.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1633076658;2fbcf55c;
X-HE-SMSGID: 1mWDq4-0007tf-D3

On 01.10.21 08:56, Kalle Valo wrote:
> (adding regressions list for easier tracking)

Feel free to ignore this message. I write it to make regzbot track above
issue. Regzbot is the regression tracking bot I'm working on. It's still
in the early stages and this is still one of the first few regression I
make it track to get started and things tested in the field. That also
why I'm sending the mail just to the regressions list (it will do its
full magic nevertheless). For details see:
https://linux-regtracking.leemhuis.info/post/inital-regzbot-running/
https://linux-regtracking.leemhuis.info/post/regzbot-approach/

#regzbot ^introduced e383c70474db32b9d4a3de6dfbd08784d19e6751
#regzbot monitor
https://lore.kernel.org/linux-wireless/bff7d309-a816-6a75-51b6-5928ef4f7a8c@exuvo.se/
#regzbot ignore-activitiy

BTW, in case anyone is reading this: the regzbot's webinterface that
gives insights into what is tracked can be found here:

https://linux-regtracking.leemhuis.info/regzbot/mainline.html

Ciao, Thorsten
