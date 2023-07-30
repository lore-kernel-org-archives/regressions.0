Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B893C20EE
	for <regressions@lists.linux.dev>; Sun, 30 Jul 2023 16:16:35 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qQ95t-0001iD-IZ; Sun, 30 Jul 2023 18:16:33 +0200
Message-ID: <3ef4662e-7888-9f41-32a3-d4cd07f1572c@leemhuis.info>
Date: Sun, 30 Jul 2023 18:16:33 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression: supported_interfaces filling enforcement
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: netdev@vger.kernel.org
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <CABikg9wM0f5cjYY0EV_i3cMT2JcUT1bSe_kkiYk0wFwMrTo8=w@mail.gmail.com>
 <ac2efb70-aa19-41d3-ac57-8aaaf39c620b@leemhuis.info>
In-Reply-To: <ac2efb70-aa19-41d3-ac57-8aaaf39c620b@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1690733795;7e21cda9;
X-HE-SMSGID: 1qQ95t-0001iD-IZ

On 08.07.23 16:01, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 04.07.23 16:28, Sergei Antonov wrote:
>> Hello!
>> This commit seems to break the mv88e6060 dsa driver:
>> de5c9bf40c4582729f64f66d9cf4920d50beb897    "net: phylink: require
>> supported_interfaces to be filled"
>>
>> The driver does not fill 'supported_interfaces'. What is the proper
>> way to fix it? I managed to fix it by the following quick code.
>> Comments? Recommendations?

#regzbot monitor:
https://lore.kernel.org/all/E1qOflM-001AEz-D3@rmk-PC.armlinux.org.uk/
#regzbot fix: 9945c1fb03a3
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


