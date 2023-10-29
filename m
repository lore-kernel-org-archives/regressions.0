Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD14E5664
	for <regressions@lists.linux.dev>; Sun, 29 Oct 2023 06:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qwzCv-0001je-OJ; Sun, 29 Oct 2023 07:23:33 +0100
Message-ID: <cb0ec234-5a91-4469-9261-2a266f0ce9ab@leemhuis.info>
Date: Sun, 29 Oct 2023 07:23:32 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Intermittent storage (dm-crypt?) freeze - regression 6.4->6.5
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Linux Stable <stable@vger.kernel.org>
Cc: Linux Regressions <regressions@lists.linux.dev>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Linux Devicemapper <dm-devel@redhat.com>,
 Matthew Wilcox <willy@infradead.org>
References: <ZTNH0qtmint/zLJZ@mail-itl> <ZTOCUJdgDDBX-ecp@debian.me>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZTOCUJdgDDBX-ecp@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1698560627;f8a5cb3c;
X-HE-SMSGID: 1qwzCv-0001je-OJ

[TLDR: This mail in primarily relevant for Linux regression tracking. A
change or fix related to the regression discussed in this thread was
posted or applied, but it did not use a Closes: tag to point to the
report, as Linus and the documentation call for. Things happen, no
worries -- but now the regression tracking bot needs to be told manually
about the fix. See link in footer if these mails annoy you.]

On 21.10.23 09:48, Bagas Sanjaya wrote:
> On Sat, Oct 21, 2023 at 05:38:58AM +0200, Marek Marczykowski-Górecki wrote:
>>
>> Since updating from 6.4.13 to 6.5.5 occasionally I hit a storage
>> subsystem freeze - any I/O ends up frozen. I'm not sure what exactly
>> triggers the issue, but often it happens when doing some LVM operations
>> (lvremove, lvrename etc) on a dm-thin volume together with bulk data
>> copy to/from another LVM thin volume with ext4 fs.
> [...] 
> #regzbot ^introduced: 5054e778fcd9cd

#regzbot fix: dm crypt: don't allocate large compound pages
#regzbot ignore-activity

(fix currently found in
https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-6.7&id=b3d87b87017d50cab1ea49fc6810c74584e00027
)

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

