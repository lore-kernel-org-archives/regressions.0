Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDCFBA2B
	for <regressions@lists.linux.dev>; Wed, 26 Jul 2023 09:21:31 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qOai0-0007bE-Sl; Wed, 26 Jul 2023 11:21:28 +0200
Message-ID: <ae1ad814-5613-704e-b0b1-4f1fc4bead44@leemhuis.info>
Date: Wed, 26 Jul 2023 11:21:27 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Fwd: ath11k: QCN9074: ce desc not available for wmi command
Content-Language: en-US, de-DE
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Kalle Valo <quic_kvalo@quicinc.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Atheros 11K <ath11k@lists.infradead.org>
References: <1326a6e4-758d-3344-d90c-8a126748b034@gmail.com>
 <6a0c3aa0-86a8-8c06-81df-2d7085946cf5@leemhuis.info>
 <16885654-09f0-c139-cc9b-c6c4d666932e@quicinc.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <16885654-09f0-c139-cc9b-c6c4d666932e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1690363292;27aedb7f;
X-HE-SMSGID: 1qOai0-0007bE-Sl

On 25.07.23 11:17, Manikanta Pubbisetty wrote:
> On 6/26/2023 6:19 PM, Linux regression tracking (Thorsten Leemhuis) wrote:
>>
>> Hmmm, there afaics was no real progress and not even a single reply from
>> a developer (neither here or in bugzilla) since the issue was reported
>> ~10 days ago. :-/

BTW: Kalle, many thx for picking this up and posting & applying the revert!

>> Manikanta, did you maybe just miss that this is caused by change of
>> yours (and thus is something you should look into)?
> 
> Extremely sorry for having this missed [...]
> 
> Hi Sanjay, [...]

FWIW, Bagas Sanjaya just forwarded the report and the reporter is not
CCed afaics (bugzilla privacy policy does not allow this, which
complicates things a lot :-/ ). You have to use bugzilla to reach the
reporter: https://bugzilla.kernel.org/show_bug.cgi?id=217536

Bagas Sanjaya: wondering if you should make that "I'm just forwarding"
aspect more obvious in your mails. And it afaics would also be good to
mentioned the author of the culprit quite early in your mails, as there
is a risk that people will miss that aspect otherwise.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
