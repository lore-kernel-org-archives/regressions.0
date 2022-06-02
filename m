Received: from mailout.rz.uni-frankfurt.de (mailout.rz.uni-frankfurt.de [141.2.22.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B9A7E3
	for <regressions@lists.linux.dev>; Thu,  2 Jun 2022 22:44:28 +0000 (UTC)
Received: from smtpauth1.cluster.uni-frankfurt.de ([10.1.1.45])
	by mailout.rz.uni-frankfurt.de with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sattler@med.uni-frankfurt.de>)
	id 1nwtYF-0000KT-C4; Fri, 03 Jun 2022 00:44:23 +0200
Received: from p57bcf53e.dip0.t-ipconnect.de ([87.188.245.62] helo=[192.168.2.17])
	by smtpauth1.cluster.uni-frankfurt.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <sattler@med.uni-frankfurt.de>)
	id 1nwtYF-0006fs-AO; Fri, 03 Jun 2022 00:44:23 +0200
Message-ID: <1f8a4bec-53bd-aaaa-49a7-b5ed4fc5ae34@med.uni-frankfurt.de>
Date: Fri, 3 Jun 2022 00:44:22 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: boot loop since 5.17.6
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
References: <11495172-41dd-5c44-3ef6-8d3ff3ebd1b2@med.uni-frankfurt.de>
 <c3b370a8-193e-329b-c73a-1371bd62edf3@med.uni-frankfurt.de>
 <181a6369-e373-b020-2059-33fb5161d8d3@med.uni-frankfurt.de>
 <YpksflOG2Y1Xng89@dev-arch.thelio-3990X>
From: Thomas Sattler <sattler@med.uni-frankfurt.de>
In-Reply-To: <YpksflOG2Y1Xng89@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 02.06.22 um 23:32 schrieb Nathan Chancellor:
>> Am 02.06.22 um 18:42 schrieb Thomas Sattler:
>>>
>>> I tried to compile 5.17.6 without the three mentioned diffs which
>>> modify the following files:
>>>
>>>      tools/objtool/check.c   and
>>>      tools/objtool/elf.c      and
>>>      tools/objtool/include/objtool/elf.h
>>>
>>> and was then able to successfully boot 5.17.6.
> 
> 5.17.6 has commit 60d2b0b1018a ("objtool: Fix code relocs vs weak
> symbols"), which has a known issue that is fixed with commit
> ead165fa1042 ("objtool: Fix symbol creation"). If you apply ead165fa1042
> on 5.17.6 or newer, does that resolve your issue?

I applied ead165fa1042 ontop of 5.17.12, but that did not make
my system boot that kernel.

Thomas

