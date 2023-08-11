Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121B04C94
	for <regressions@lists.linux.dev>; Fri, 11 Aug 2023 08:01:29 +0000 (UTC)
Received: from 46.183.103.8.relaix.net ([46.183.103.8] helo=[172.18.99.178]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qUN5J-000677-KJ; Fri, 11 Aug 2023 10:01:26 +0200
Message-ID: <ea44e743-10a0-6a2d-d1a7-92d411674790@leemhuis.info>
Date: Fri, 11 Aug 2023 10:00:50 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/32] mm/vmalloc: vmalloc_to_page() use
 pte_offset_kernel()
Content-Language: en-US, de-DE
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org
References: <42279f1f-7b82-40dc-8546-86171018729c@sirena.org.uk>
 <901ae88d-ad0c-4e9d-b199-f1566cc62a00@lucifer.local>
 <c2358f37-ebaa-44d1-b443-ff91bdedc00b@sirena.org.uk>
 <977ddee4-35f0-fcd1-2fd-1c3057e7ea2a@google.com>
 <fbb2b76c-bc5c-4d75-b8cd-37479de688d4@sirena.org.uk>
 <b479b946-f052-eb75-295d-6fa7c2d8ce8e@google.com>
 <591b5253-47f0-440c-84b6-7786ff59667d@sirena.org.uk>
 <20230720103227.GB11034@willie-the-truck>
 <df264993-107c-44a1-a8ff-245bce044206@sirena.org.uk>
 <88bb7f30-cbfe-feb4-1101-b7c98843652d@leemhuis.info>
 <59946f0b-2a31-4bb2-a5a5-a051f3978c26@sirena.org.uk>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <59946f0b-2a31-4bb2-a5a5-a051f3978c26@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1691740890;6654904d;
X-HE-SMSGID: 1qUN5J-000677-KJ

On 08.08.23 13:09, Mark Brown wrote:
> On Tue, Aug 08, 2023 at 07:52:43AM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> 
>> Hi Mark, just wondering did anything come out of this and is this still
>> happening? I'm just wondering, as I still have this on my list of
>> tracked regressions.
> 
> It's fixed.

In that case:

#regzbot resolve: fixed according to reporter
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
