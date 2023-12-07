Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D2D3D0DD
	for <regressions@lists.linux.dev>; Thu,  7 Dec 2023 13:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rBEtL-0006HO-Pv; Thu, 07 Dec 2023 14:58:15 +0100
Message-ID: <e2d47b6c-3420-4785-8e04-e5f217d09a46@leemhuis.info>
Date: Thu, 7 Dec 2023 14:58:13 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: md raid6 oops in 6.6.4 stable
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>, Genes Lists <lists@sapience.com>,
 snitzer@kernel.org, song@kernel.org, yukuai3@huawei.com, axboe@kernel.dk,
 mpatocka@redhat.com, heinzm@redhat.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux RAID <linux-raid@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
Cc: Bhanu Victor DiCara <00bvd0+linux@gmail.com>, Xiao Ni <xni@redhat.com>,
 Guoqing Jiang <guoqing.jiang@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <6e6816dd-2ec5-4bca-9558-60cfde46ef8c@sapience.com>
 <ZXHJEkwIJ5zKTMjV@archie.me>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <ZXHJEkwIJ5zKTMjV@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1701957515;980cbc4c;
X-HE-SMSGID: 1rBEtL-0006HO-Pv

On 07.12.23 14:30, Bagas Sanjaya wrote:
> On Thu, Dec 07, 2023 at 08:10:04AM -0500, Genes Lists wrote:
>> I have not had chance to git bisect this but since it happened in stable I
>> thought it was important to share sooner than later.
>>
>> One possibly relevant commit between 6.6.3 and 6.6.4 could be:
>>
>>   commit 2c975b0b8b11f1ffb1ed538609e2c89d8abf800e
>>   Author: Song Liu <song@kernel.org>
>>   Date:   Fri Nov 17 15:56:30 2023 -0800
>>
>>     md: fix bi_status reporting in md_end_clone_io
>>
>> log attached shows page_fault_oops.
>> Machine was up for 3 days before crash happened.
> 
> Can you confirm that culprit by bisection?

Bagas, I know you are trying to help, but sorry, I'd say this is not
helpful at all -- any maybe even harmful.

From the quoted texts it's pretty clear that the reporter knows that a
bisection would be helpful, but currently is unable to perform one --
and even states reasons for reporting it without having it bisected. So
your message afaics doesn't bring anything new to the table; and I might
be wrong with that, but I fear some people in a situation like this
might even be offended by a reply like that, as it states something
already obvious.

Ciao, Thorsten

