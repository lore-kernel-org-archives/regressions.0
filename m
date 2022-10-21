Received: from p3plwbeout27-03.prod.phx3.secureserver.net (p3plsmtp27-03-2.prod.phx3.secureserver.net [216.69.139.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867C37E
	for <regressions@lists.linux.dev>; Fri, 21 Oct 2022 01:51:43 +0000 (UTC)
Received: from mailex.mailcore.me ([94.136.40.144])
	by :WBEOUT: with ESMTP
	id lh9XoQBCSeEaclh9XoyVip; Thu, 20 Oct 2022 18:48:52 -0700
X-CMAE-Analysis: v=2.4 cv=SKuH6MjH c=1 sm=1 tr=0 ts=6351fa84
 a=wXHyRMViKMYRd//SnbHIqA==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=IkcTkHD0fZMA:10 a=Qawa6l4ZSaYA:10 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=FXvPX3liAAAA:8 a=iYUCbxK1D4EDwxi5o2oA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=UObqyxdv-6Yh2QiB9mM_:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: lh9XoQBCSeEac
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175] helo=[192.168.178.33])
	by smtp07.mailcore.me with esmtpa (Exim 4.94.2)
	(envelope-from <phillip@squashfs.org.uk>)
	id 1olh9W-0007gx-8q; Fri, 21 Oct 2022 02:48:50 +0100
Message-ID: <3a6c0d0c-68ad-ffbb-0e56-c0282ac84149@squashfs.org.uk>
Date: Fri, 21 Oct 2022 02:48:46 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: BISECT result: 6.0.0-RC kernels trigger Firefox snap bug with
 6.0.0-rc3 through 6.0.0-rc7
To: Slade Watkins <srw@sladewatkins.net>, Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Jintao Yin <nicememory@gmail.com>, hsinyi@chromium.org,
 linux-kernel@vger.kernel.org, marcmiltenberger@gmail.com,
 mirsad.todorovac@alu.unizg.hr, regressions@leemhuis.info,
 regressions@lists.linux.dev
References: <20221018174157.1897-1-phillip@squashfs.org.uk>
 <20221020135545.586-1-nicememory@gmail.com>
 <41ef4b22-eea8-2d67-99d8-6aaae7d25ac1@squashfs.org.uk>
 <02b72b86-7240-5530-477a-c8bdcfd35ef5@gmail.com>
 <CA+pv=HO36vMH6Uqu412MF+Hmu-+57QeapGt6k+QDDxr-AsbJkw@mail.gmail.com>
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <CA+pv=HO36vMH6Uqu412MF+Hmu-+57QeapGt6k+QDDxr-AsbJkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated:  phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfGRDMg9se9829Cph8jY9/bazs57m3Y9oWlWBFDs5ZaRNhA9bxoXcaYPO7d+9r9mhr0aXDqWjeFZH3W2d6/bc/Kf3XfCh/p4Btgcx3S4FJ3g3EZWPbewi
 cWhKvowB4QS7JBnB2amJ+p65sq7/g7Cy8DLiGmyTcRCHBvAWMuHlgQjKiRxMEg7MLljPgyZBHm7Dl0vuluZfcykJzAL4iFd5L5w=

On 21/10/2022 00:44, Slade Watkins wrote:
> [Resend due to formatting issue, thanks gmail.]
> 
> On Thu, Oct 20, 2022 at 7:23 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>>
>> Ah! I was about to test his third fixup patch. I prefer to go
>> with your fix instead (as the formal patch).
> 
> +1, agreed.
> 
> -srw

His patch is wrong, plus he's broken a number of rules of conduct, two 
serious.  But, I will not reprimand him as kernel maintainer for what is
probably extreme naivety, unless I have to.

The link to the full set of patches is here

https://lore.kernel.org/lkml/20221020223616.7571-1-phillip@squashfs.org.uk/

The first patch fixes the regression reported here in the correct way.

The second patch fixes another regression (which is separate to the
regression causing the issue here).  This is where the code incorrectly
extends readahead beyond the end of the file.  This is the reason for
the unused trailing pages that Jintao Yin noticed.  But, this patch
fixes the cause, rather than fixing the symptom.

The third patch fixes the buffer release race condition that I
posted a fix for earlier.

Spitting this into three patches is one of the rules.  Each patch should
do one thing, and one thing only.  Three separate regressions means
three separate patches.  This is a requirement for "git bisect" to work
effectively.

Phillip

