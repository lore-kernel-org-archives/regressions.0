Received: from domac.alu.hr (domac.alu.hr [161.53.235.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119B5A52
	for <regressions@lists.linux.dev>; Mon, 17 Oct 2022 00:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by domac.alu.hr (Postfix) with ESMTP id CCC6B604EF;
	Mon, 17 Oct 2022 02:43:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
	t=1665967411; bh=nDU1TF+7P9JYSotz148U6wL2fU3jQox5ewxQ7p68wHY=;
	h=Date:Subject:References:To:From:In-Reply-To:From;
	b=IxPpIiMa1lRQ4BFMB43MBdbiakaG+17mwa+Vk5Tn4HtcagHOnaAyHlo9/2wYlJy7o
	 rvE3yPh4Wqf5t/j7/XxEJ7cRK5XtTPo8YAdYrioDD0TWrCWpoDCmDKFAav9sO7PpOm
	 sqjoorufg+pgOWVupYHeLEHfxK5hfwMovDhVaqLA1EjtfBaiiVioacA8K6q4dsk6ai
	 gJ3PnEFg4UvwuJKT0h9DXJBFSz3LX6Z0DYdVpZaIk01oCh+1X+Uh7QWj0OxxWF5uyg
	 488a95hGvU5vNpgJoW35iQKFpLogtMTPdlZ9K+A3U41v6BfYnqkPW/xMmlxuHmjdmV
	 KOJ3aaCI7SDzg==
X-Virus-Scanned: Debian amavisd-new at domac.alu.hr
Received: from domac.alu.hr ([127.0.0.1])
	by localhost (domac.alu.hr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bL4mkLli08b3; Mon, 17 Oct 2022 02:43:29 +0200 (CEST)
Received: from [192.168.0.12] (unknown [188.252.197.215])
	by domac.alu.hr (Postfix) with ESMTPSA id 3BA07604E6;
	Mon, 17 Oct 2022 02:43:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
	t=1665967409; bh=nDU1TF+7P9JYSotz148U6wL2fU3jQox5ewxQ7p68wHY=;
	h=Date:Subject:References:To:From:In-Reply-To:From;
	b=tnfrcfeosWPCwGfrVO3nv2iDLLNTPZHafFh+4XguEEsJLo0FVQgzpdCCOOlSJ9n/p
	 Vvz3PXJ57zhC81QB/KO1KnclHWrKOPl/bMLdU8eHUUd0GC4lZOBdYZwYoE2WZDcPvC
	 J9spG3wCWxMxyViGY37HUcN2gcBR99yK3i6TEyxE622DTsD69RA70sXvvyHDrCK6xX
	 hn+JAIBNrXaMjJVmNM3MtmvdwnYFVMRh+mDDmNd/GSMgpQgsL08Az64GUKgc9JrjQh
	 C0CL9uHZOQuDO0mWxrFQ3T0RB5mQ8xmbpj9IRASSsmtUgq0Z2tW+R7twpJOD0Cxp+Y
	 6K5HpdWEkVsHQ==
Message-ID: <08493510-4ed2-6c31-66b1-04cd8105e5ee@alu.unizg.hr>
Date: Mon, 17 Oct 2022 02:43:29 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Fwd: BISECT result: 6.0.0-RC kernels trigger Firefox snap bug with
 6.0.0-rc3 through 6.0.0-rc7
Content-Language: en-US
References: <fe5f21c7-40ec-92ab-8071-1f67461d44fe@alu.unizg.hr>
To: LKML <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
From: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
In-Reply-To: <fe5f21c7-40ec-92ab-8071-1f67461d44fe@alu.unizg.hr>
X-Forwarded-Message-Id: <fe5f21c7-40ec-92ab-8071-1f67461d44fe@alu.unizg.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16. 10. 2022. 22:19, Phillip Lougher wrote:
> On 16/10/2022 20:55, Phillip Lougher wrote:
>>
>> Tracking down bugs of this sort is always a process of elimination,
>> and gathering information to pinpoint the exact circumstances of why
>> it is triggering.
>>
>> Next step is to download the exact snap(s) where the problems are 
>> occurring, as this may provide some insights.
>>
>> I don't run Ubuntu, and I don't use snaps.  Can you provide the
>> download link(s) of the snap(s) that cause problems?  If there's
>> any firefox snaps that don't cause problems those will be useful
>> too.
>>
>
> It appears there's a searchable "Snap Store" https://snapcraft.io,
> but, it doesn't give any download links to the actual snaps which
> is rather annoying.
>
> Does anyone know how to get the download link?  I have not run
> Ubuntu for over 14 years and have absolutely no wish to do so
> now either.
>
> Thanks
>
> Phillip
>
>> You don't mention if there's any errors present in "dmesg" when
>> this happens, and so I'm assuming there aren't any?
>>
>> Phillip

Hi, Phillip,

No, there weren't anynew iterms in dmesg -l err output other than these 
usual ones, common to the situations
where the Firefox in snap is working. Only the kernel version is different.

I have managed to reproduce the situation on AlmaLinux 8.6 by installing 
the snapd rpm and then running
a regular "snap install firefox". NOTE: I had to manually enable 
squashfs kernel module.

Otherwise, the Ubuntu 22.04 Firefox 104.x and 105.0.x snaps are also the 
default Firefox snaps from the snap store.

The only exception is that I used 15+ windows and over 200 tabs in the 
testing case, many multimedia Youtube
channels, Yahoo mail, Outlook mail, and quite a few websites. This 
combination triggers the Verdeen errors very
quickly (only on vulnerable 6.0 kernels, on 5.19.x kernels it works like 
a charm).

Thank you.

It is obvious that the snapd + squashfs + Firefox combination triggers 
the bug under heavy load (both on Ubuntu
22.04 jammy and AlmaLinux 8.6.

Hope this helps.

Optionally, I could send the Firefox list of opened windows and tabs if 
I knew where the snaps store it. With the
/usr/bin/firefox version I knew it.

Kind regards,
Mirsad

--
Mirsad Goran Todorovac
Sistem inženjer
Grafički fakultet | Akademija likovnih umjetnosti
Sveučilište u Zagrebu
-- 
System engineer
Faculty of Graphic Arts | Academy of Fine Arts
University of Zagreb, Republic of Croatia
The European Union

