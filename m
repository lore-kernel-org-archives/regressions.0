Received: from p3plwbeout25-05.prod.phx3.secureserver.net (p3plsmtp25-05-2.prod.phx3.secureserver.net [216.69.139.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D2F4C64
	for <regressions@lists.linux.dev>; Tue, 18 Oct 2022 13:39:25 +0000 (UTC)
Received: from mailex.mailcore.me ([94.136.40.144])
	by :WBEOUT: with ESMTP
	id kmllosI4yw3ohkmlloFwnb; Tue, 18 Oct 2022 06:36:34 -0700
X-CMAE-Analysis: v=2.4 cv=OruKdwzt c=1 sm=1 tr=0 ts=634eabe2
 a=wXHyRMViKMYRd//SnbHIqA==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=IkcTkHD0fZMA:10 a=Qawa6l4ZSaYA:10 a=lAgNKBcoAAAA:8
 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=JfrnYn6hAAAA:8 a=DT4-p4iOuRVd-7To1hAA:9
 a=QEXdDO2ut3YA:10 a=drE6d5tx1tjNRBs8zHOc:22 a=AjGcO6oz07-iQ99wixmX:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=1CNFftbPRP8L7MoqJWF3:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: kmllosI4yw3oh
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175] helo=[192.168.178.33])
	by smtp05.mailcore.me with esmtpa (Exim 4.94.2)
	(envelope-from <phillip@squashfs.org.uk>)
	id 1okmlj-0008Eo-2D; Tue, 18 Oct 2022 14:36:32 +0100
Message-ID: <7521869b-5425-0143-3e14-6e39bad47b21@squashfs.org.uk>
Date: Tue, 18 Oct 2022 14:36:30 +0100
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
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
Cc: Jintao Yin <nicememory@gmail.com>, bagasdotme@gmail.com,
 linux-kernel@vger.kernel.org, marcmiltenberger@gmail.com,
 regressions@leemhuis.info, regressions@lists.linux.dev, srw@sladewatkins.net
References: <20221015205936.5735-1-phillip@squashfs.org.uk>
 <20221018021507.612-1-nicememory@gmail.com>
 <41c05ece-2e63-391a-e1ba-fc1acb235559@alu.unizg.hr>
 <CAJMQK-hgQEkhgpO9VFOCgn-cKtVsr7Hb_58pAYiGoDi5SzGZtA@mail.gmail.com>
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <CAJMQK-hgQEkhgpO9VFOCgn-cKtVsr7Hb_58pAYiGoDi5SzGZtA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated:  phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfObCjT/FgMPxXAbOm/o7QhyzBYi5OC9ORrRstLlYecGCTci4EAdsBpvmRI6CytV8uXo/xOX8byd9hH6FrRz89hnGz0VqDJ3TApeRhqkRrEb3UmpUL9uM
 3zb6mgEPWNbz2hcyWeJHhrpdzEJ3Q0omSz1X1KwcRrk+RIQb9bPOBkUKNBwc2KRnwYR7Upixz+N9aXrv7t6rpkYPR/xLwrj4UlQ=

On 18/10/2022 09:24, Hsin-Yi Wang wrote:
> On Tue, Oct 18, 2022 at 2:52 PM Mirsad Todorovac
> <mirsad.todorovac@alu.unizg.hr> wrote:
>>
>> On 10/18/22 04:15, Jintao Yin wrote:
>>
>>> On Sat, Oct 15, 2022 at 09:59:36PM +0100, Phillip Lougher wrote:
>>>> Thorsten Leemhuis <regressions@leemhuis.info> wrote:
>>>>> Topposting, to make this easier to access for everyone.
>>>>>
>>>>> @Mirsad, thx for bisecting.
>>>>>
>>>>> @Phillip: if you want to see a problem description and the whole
>>>>> backstory of the problem that apparently is caused by       b09a7a036d20
>>>>> ("squashfs: support reading fragments in readahead call"), see this
>>>>> thread (Mirsad sadly started a new one with the quoted mail below):
>>>>> https://lore.kernel.org/all/b0c258c3-6dcf-aade-efc4-d62a8b3a1ce2@alu.unizg.hr/
>>>>>
>>>> The above backstory tends to suggest data corruption which is happening
>>>> after a couple of hours especially on heavy loads, e.g. the comment
>>>>
>>>>> On 10/3/22 at 4:18 AM, Mirsad Goran Todorovac wrote:
>>>>> The bug usually isn't showing immediately, but after a couple of hours
>>>>> of running (especially with multimedia running inside Firefox).
>>>> Which is typically caused by double freed buffers or race conditions in
>>>> freeing and reusing.
>>>>
>>>> Thanks Mirsad for the following
>>>>
>>>> On Sat, 15 Oct 2022 16:59:44 +0200, Mirsad Goran Todorovac wrote:
>>>>> Here are the results of the requested bisect on the bug involving the
>>>>> Firefox snap build 104.x, 105.0.x, squashfs and which was manifested on
>>>>> both Ubuntu snap and with snapd in AlmaLinux 8.6 (CentOS fork):
>>>>>
>>>>> mtodorov@domac:~/linux/kernel/linux_stable$ git bisect log
>>>>> git bisect start
>>>>> # bad: [568035b01cfb107af8d2e4bd2fb9aea22cf5b868] Linux 6.0-rc1
>>>>> git bisect bad 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
>>>>> # good: [51dd976781da8c0b47e106ed59a96d7c28972ce4] Linux 5.19.15
>>>>> git bisect good 51dd976781da8c0b47e106ed59a96d7c28972ce4
>>>>> # good: [3d7cb6b04c3f3115719235cc6866b10326de34cd] Linux 5.19
>>>>> git bisect good 3d7cb6b04c3f3115719235cc6866b10326de34cd
>>>>> # good: [b44f2fd87919b5ae6e1756d4c7ba2cbba22238e1] Merge tag
>>>>> 'drm-next-2022-08-03' of git://anongit.freedesktop.org/drm/drm
>>>>> git bisect good b44f2fd87919b5ae6e1756d4c7ba2cbba22238e1
>>>>> # good: [6614a3c3164a5df2b54abb0b3559f51041cf705b] Merge tag
>>>>> 'mm-stable-2022-08-03' of
>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>>>>> git bisect good 6614a3c3164a5df2b54abb0b3559f51041cf705b
>>>>> # bad: [eb5699ba31558bdb2cee6ebde3d0a68091e47dce] Merge tag
>>>>> 'mm-nonmm-stable-2022-08-06-2' of
>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>>>>> git bisect bad eb5699ba31558bdb2cee6ebde3d0a68091e47dce
>>>>> # good: [24df5428ef9d1ca1edd54eca7eb667110f2dfae3] ALSA: hda/realtek:
>>>>> Add quirk for HP Spectre x360 15-eb0xxx
>>>>> git bisect good 24df5428ef9d1ca1edd54eca7eb667110f2dfae3
>>>>> # good: [c993e07be023acdeec8e84e2e0743c52adb5fc94] Merge tag
>>>>> 'dma-mapping-5.20-2022-08-06' of
>>>>> git://git.infradead.org/users/hch/dma-mapping
>>>>> git bisect good c993e07be023acdeec8e84e2e0743c52adb5fc94
>>>>> # good: [4cfa6ff24a9744ba484521c38bea613134fbfcb3] powerpc/64e: Fix
>>>>> kexec build error
>>>>> git bisect good 4cfa6ff24a9744ba484521c38bea613134fbfcb3
>>>>> # good: [24cb958695724ffb4488ef4f65892c0767bcd2f2] Merge tag
>>>>> 's390-5.20-1' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux
>>>>> git bisect good 24cb958695724ffb4488ef4f65892c0767bcd2f2
>>>>> # good: [db98b43086275350294f5c6f797249b714d6316d] squashfs: always
>>>>> build "file direct" version of page actor
>>>>> git bisect good db98b43086275350294f5c6f797249b714d6316d
>>>>> # good: [6ba592fa014f21f35a8ee8da4ca7b95a018f13e8] video: fbdev: s3fb:
>>>>> Check the size of screen before memset_io()
>>>>> git bisect good 6ba592fa014f21f35a8ee8da4ca7b95a018f13e8
>>>>> # good: [b5a8466d37d30cfcc8015789f4a3f0c44b6c7bc6] Merge tag
>>>>> 'for-5.20/fbdev-1' of
>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev
>>>>> git bisect good b5a8466d37d30cfcc8015789f4a3f0c44b6c7bc6
>>>>> # bad: [97d3b2676fc6bc4865eb825037f4492f0fb804eb] ocfs2: remove some
>>>>> useless functions
>>>>> git bisect bad 97d3b2676fc6bc4865eb825037f4492f0fb804eb
>>>>> # bad: [591c32bddbe20ba0e172d9def3c7f22b9c926ad9] kernel/hung_task: fix
>>>>> address space of proc_dohung_task_timeout_secs
>>>>> git bisect bad 591c32bddbe20ba0e172d9def3c7f22b9c926ad9
>>>>> # bad: [b09a7a036d2035b14636cd4c4c69518d73770f65]  squashfs: support
>>>>> reading fragments in readahead call
>>>>> git bisect bad b09a7a036d2035b14636cd4c4c69518d73770f65
>>>>> mtodorov@domac:~/linux/kernel/linux_stable$
>>>>>
>>>>> The git bisect stopped at the squashfs commit
>>>>> b09a7a036d2035b14636cd4c4c69518d73770f65, so I included Phillip in Cc:,
>>>>> according to the Code of Conduct.
>>>> Which identified the "squashfs: support reading fragments in readahead call"
>>>> patch.
>>>>
>>>> There is a race-condition introduced in that patch, which involves cache
>>>> releasing and reuse.
>>>>
>>>> The following diff will fix that race-condition.  It would be great if
>>>> someone could test and verify before sending it out as a patch.
>>>>
>>>> Thanks
>>>>
>>>> Phillip
>>> Hi Phillip,
>>>     There is a logical bug in commit 8fc78b6fe24c36b151ac98d7546591ed92083d4f
>>>     which is parent commit of commit b09a7a036d2035b14636cd4c4c69518d73770f65.
>>>
>>>     In function squashfs_readahead(...),
>>>     file_end is initialized with i_size_read(inode) >> msblk->block_log,
>>>     which means the last block index of the file.
>>>     But later in the logic to check if the page is last one or not the
>>>     code is
>>>       if (pages[nr_pages - 1]->index == file_end && bytes) {
>>>         ...
>>>       }
>>>     , use file_end as the last page index of file but actually is the last
>>>     block index, so for the common setup of page and block size, the first
>>>     comparison is true only when pages[nr_pages - 1]->index is 0.
>>>     Otherwise, the trailing bytes of last page won't be zeroed.
>>>
>>>     Maybe it's the real cause of the snap bug in some way.
>>>
> Hi Jintao,
> 
> Thanks for pointing out and sorry for missing this. Does the following
> diff improve the issue?
> 
> diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
> index e56510964b229..7759bd70dfbf2 100644
> --- a/fs/squashfs/file.c
> +++ b/fs/squashfs/file.c
> @@ -600,7 +600,7 @@ static void squashfs_readahead(struct
> readahead_control *ractl)
> 
>                          /* Last page (if present) may have trailing
> bytes not filled */
>                          bytes = res % PAGE_SIZE;
> -                       if (pages[nr_pages - 1]->index == file_end && bytes)
> +                       if ((pages[nr_pages - 1]->index >> shift) ==
> file_end && bytes)
>                                  memzero_page(pages[nr_pages - 1], bytes,
>                                               PAGE_SIZE - bytes);
> 
> 
> readahead only handles the case that the first page and the last page
> have the same block index:
>      index = pages[0]->index >> shift;
>      if ((pages[nr_pages - 1]->index >> shift) != index)
>          goto skip_pages;
> 
> The diff above makes a difference to SQUASHFS_INVALID_BLK case, which
> will not be handled by squashfs_readahead_fragment() if
> index==file_end.
> With the above diff, it will now be memzero_page().
> 
> Hi Phillip,
> Does the SQUASHFS_INVALID_BLK case handling with index==file_end
> sounds reasonable to you?
> 

That is OK.  When fragment_block is SQUASHFS_INVALID_BLK, it means
there is no fragment.

Phillip

> Thanks.
> 
>>>     Thanks,
>>>
>>>     Jintao
>>
>> Dear Jintao,
>>
>> Forgive me for noticing that this is no longer Phillip's code, so I took the
>> freedom as the original submitter of the bug to include Hsin-Yi into the Cc:
>> list, so he'd be informed about the error in his code.
>>
>> Phillip:
>> I usually stop myself at bisecting bugs, and not people, so if you think that
>> I was demeaning your professional contribution, I will pull a halt on this and
>> pull out of this thread.
>>
>> I am more like weeks than decades long in Linux kernel study, so I realise I
>> haven't earned the right to give you lessons, and if I sounded like that, I
>> apologise again.
>>
>> Owing to the Author of my story, it is more important for me to win hearts for
>> my Saviour than points in bug hunting.
>>
>> Thank you.
>>
>> --
>> Mirsad Goran Todorovac
>> Sistem inženjer
>> Grafički fakultet | Akademija likovnih umjetnosti
>> Sveučilište u Zagrebu
>> --
>> System engineer
>> Faculty of Graphic Arts | Academy of Fine Arts
>> University of Zagreb, Republic of Croatia
>>

