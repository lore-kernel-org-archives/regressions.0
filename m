Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFEF17738
	for <regressions@lists.linux.dev>; Mon, 27 Nov 2023 10:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="pKEC5LI8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1701079248; x=1701684048; i=deller@gmx.de;
	bh=/8XpAH+1Byo/Nzo7LL5XYsYji7iG4OxW0UvH1LaRpOQ=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=pKEC5LI8NBzf1QrCkA/P7HBJEEEtMbF+0H/9BOAzHE6cqSyAcYnuX7AP+ufA37Ou
	 5wf8BRnqLdjqDUBW/n+bkR9CCCtQJq1hGNHBNdcI6A2dB2jG/2epqdPAqK2RD60RM
	 J1EMbuwY9mFeXMb7d24wGEBoMigVSUBWxcVw9PTJQs0R6/KtEFv9w/5WwfGrLSKG9
	 rAUFHhoG92aFy5neXDjcXuz7jehJU2Qr4Js+V3GE2VIX+PxhWs+xO78DpW0rwCh5h
	 EMMuWwFtQaYeR9k6DLY6KvVNPrI+uz3YhD948zVpRCWZ//0NPeWAhWvE8rFE2YBOv
	 i8qxDe43SIG9XuDM2A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.146.210]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUXpK-1qh3K340dE-00QPrR; Mon, 27
 Nov 2023 11:00:48 +0100
Message-ID: <1e22ec3c-77a6-42d5-a3e8-221c26c03265@gmx.de>
Date: Mon, 27 Nov 2023 11:00:45 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: parisc: bug.h:71:17: error: invalid 'asm': operand number out of
 range
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 linux-parisc <linux-parisc@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 John David Anglin <dave.anglin@bell.net>
References: <CA+G9fYsM4Aa1smp2Xahf=z2WOGpXsAC3GzUW06HJN9pucm837Q@mail.gmail.com>
 <69f4eb55-a96b-49a1-9503-5796e90c2add@leemhuis.info>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <69f4eb55-a96b-49a1-9503-5796e90c2add@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:e7CALSygXlEBYezZlpySUmNej5LnGeieAK58Di3/muYa+Gw2I3g
 Hz92VQxUN27YzM8RNz2sSe+T5nWIZc/YQcNwUkdnP01H0KHKc3EYePvkTBogVA+1BRtbCZQ
 1kt3VnsQg8+QVfOtHgdc6rc1cw3jrt+cMDHANzqXB82siwpjd5aBHb+LT3WOp7D72OFUyQu
 7uoFTP+FW3U6nXwOI5kHA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iDnF4sPnXvI=;L/veR3qIZLig5yrFWFhdPIkXrPb
 Kz0GGREF35VafG6aadVd98MAQMsd8DhlPShZYt+kUyp7IOJB/RUgFZ+lK3xJDK0LZZHkDUzk3
 RonmmRkL2iunihD9WH2xzZhg045t5XB6FIo1rxy0N/HC20oIa1o1eb6RAqx2TbJ+qltaR8qO9
 AQe6rYB/vR/iEew5ONsOYCQ9kxIwccCXZoL7RAbchv9b5g6XvdBvD3OgA4TIxIPHeECrdfjoX
 1DW+f8oDIFTl6DgX7iL9MwxdJUqY9lHRDBOSIQY+uFAOE6oWYyyYsGNoy9Lkco649ZeqhCOk7
 iijmR35ab6EEJT0zVX/giTuvQ2+KBkeghlB7L75KZwZgUH6Z37GDfgibDifyY3nWxKtTBcCMx
 A0jAIT3waiLrfZIugwnJYN8OCoEq+JW/lGXjnnfkLcGPvfDXytutbd/qxFAYg36/kA/Fvfb6L
 uTjXtMnWsmaXGKh5qEJqNLSVgCD4wVo9NDW9Xn7lDa85C7aZbraoWKHh7922SAjsGhrJFmtR8
 Wznsl+8mY1HF0XJUScZXE0srbjiCZ8d2TAHBgr40q/eqD/KPrE4H11LAXW4FSOf4T96yNTFmA
 g3B/bIW3hi+dbjgdpvKHFx+z0o1xcwTgFjtDFj2g3TeE9X+jlUb7i6v3fLu8O6m6xu1Ye/euO
 dRPen8ImjLArylIsonjA+Kn3HzmDY0r6sXS1FN887NRVeGdEvUKTwFbOkdxCRjo8ExM8tfINw
 mZi8KwDRlHrA+IThm4hkMNNPWO3yhu7H6N/Aktp2K9jdXZmfbCJGjj0eQdxeVBmI/Uz/M/jaP
 P32b5hL+ff554JXKUHwdtiEMxsUMDxPDHGFYi4oaysyTQ=

On 11/27/23 10:20, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 27.11.23 09:57, Naresh Kamboju wrote:
>> The parisc tinyconfig built with gcc-11 failed on mainline v6.7-rc3.
>>
>> git_describe: v6.7-rc3
>> git_repo: https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline
>>
>> parisc:
>>    build:
>>      * gcc-11-tinyconfig
>>
>> In file included from lib/math/int_log.c:14:
>> lib/math/int_log.c: In function 'intlog2':
>> arch/parisc/include/asm/bug.h:71:17: error: invalid 'asm': operand
>> number out of range
>>     71 |                 asm volatile("\n"
>>           \
>>        |                 ^~~
>>
>>
>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>>
>> Links:
>>   - https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.7-rc3/testrun/21323529/suite/build/test/gcc-11-tinyconfig/log
>>   - https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.7-rc3/testrun/21323529/suite/build/test/gcc-11-tinyconfig/history/
>>   - https://storage.tuxsuite.com/public/linaro/lkft/builds/2Yk9c7RsS6V5pdDdOYzHSrlpZQk/

Thanks for reporting!

I've pushed a patch into the for-next git tree to fix this.
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/log/?h=for-next

Thanks!
Helge
