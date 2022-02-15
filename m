Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACAE1579
	for <regressions@lists.linux.dev>; Tue, 15 Feb 2022 14:51:18 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nJzAd-0000Fm-Je; Tue, 15 Feb 2022 15:51:11 +0100
Message-ID: <d054fe49-702a-c881-b5a0-f7c15148f12a@leemhuis.info>
Date: Tue, 15 Feb 2022 15:51:11 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] NFS: LOOKUP_DIRECTORY is also ok with symlinks
 #forregzbot
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: regressions@lists.linux.dev
References: <20220208183823.1391397-1-trondmy@kernel.org>
 <d16aac1e-a3aa-309a-0130-c60147c980d1@molgen.mpg.de>
 <82dffa3e-1b14-e590-aaf6-f9f8570e616c@molgen.mpg.de>
 <f7a7d0e1-41ab-f648-97a3-9fd92e0e2eb2@leemhuis.info>
In-Reply-To: <f7a7d0e1-41ab-f648-97a3-9fd92e0e2eb2@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1644936679;c9cf0085;
X-HE-SMSGID: 1nJzAd-0000Fm-Je

for the record:

#regzbot fixed-by: e0caaf75d443e02e55e146fd75fe2efc8aed5540

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=master&id=e0caaf75d443e02e55e146fd75fe2efc8aed5540

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '' in the subject, to make them easy to spot and filter.

On 11.02.22 12:40, Thorsten Leemhuis wrote:
> On 11.02.22 11:55, Paul Menzel wrote:
>> #regzbot monitor:
>> https://lore.kernel.org/linux-nfs/20220208183823.1391397-1-trondmy@kernel.org/
> 
> Thx for trying, but that failed (as is unneeded, see below): regzbot
> can't determine which of the tracked regression might be meant here, so
> it can't associate it with your report.
> 
>> Am 09.02.22 um 23:02 schrieb Paul Menzel:
>>
>>> Am 08.02.22 um 19:38 schrieb trondmy@kernel.org:
>>>> From: Trond Myklebust <trond.myklebust@hammerspace.com>
>>>>
>>>> Commit ac795161c936 (NFSv4: Handle case where the lookup of a directory
>>>> fails) [1], part of Linux since 5.17-rc2, introduced a regression, where
>>>> a symbolic link on an NFS mount to a directory on another NFS does not
>>>> resolve(?) the first time it is accessed:
>>>>
>>>> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
>>>> Fixes: ac795161c936 ("NFSv4: Handle case where the lookup of a
>>>> directory fails")
>>>> Signed-off-by: Trond Myklebust <trond.myklebust@hammerspace.com>
>>>
>>> Thank you for fixing it so quickly. My colleague verified, that it
>>> fixes our issue.
>>>
>>> Tested-by: Donald Buczek <buczek@molgen.mpg.de>
>>
>> Also for regzbot:
>>
>> Link:
>> https://lore.kernel.org/linux-nfs/0235e04a-18aa-ccbf-f520-38a2d55e8b54@molgen.mpg.de/
> 
> Hmmm, regzbot from this could in theory be modified to determine which
> regression was meant, but right now regzbot processes commands
> sequentially, so in this order it wouldn't work anyway.
> 
> But there is a bigger problem: that link points to a reply to your
> report, not the report. I guess I can modify regzbot to handle such
> cases, but I have more pressing issue right now, sorry. But I'll keep it
> in mind.
> 
> The right link tag one would have been:
> 
> Link:
> https://lore.kernel.org/r/bd2075f0-2343-5bfa-83bf-0e916303727d@molgen.mpg.de/
> 
> (s!/r/!/linux-nfs/! would have worked for regzbot as well)
> 
> Trond, can you please add this tag to your patch in case you respin it,
> as explained, as explained in
> 'Documentation/process/submitting-patches.rst' and
> 'Documentation/process/5.Posting.rst'.
> 
> BTW, paul: Regzbot will monitor every subthread with a proper link tag
> (like I gave above), so there is no need for a "#regzbot monitor" in
> anyway if developers would just place the tags as the documentation states.
> 
> Ciao, Thorsten
> 
> 
>>>> ---
>>>>   fs/nfs/dir.c | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
>>>> index e128503728f2..6dee4e12d381 100644
>>>> --- a/fs/nfs/dir.c
>>>> +++ b/fs/nfs/dir.c
>>>> @@ -2051,14 +2051,14 @@ int nfs_atomic_open(struct inode *dir, struct
>>>> dentry *dentry,
>>>>       if (!res) {
>>>>           inode = d_inode(dentry);
>>>>           if ((lookup_flags & LOOKUP_DIRECTORY) && inode &&
>>>> -            !S_ISDIR(inode->i_mode))
>>>> +            !(S_ISDIR(inode->i_mode) || S_ISLNK(inode->i_mode)))
>>>>               res = ERR_PTR(-ENOTDIR);
>>>>           else if (inode && S_ISREG(inode->i_mode))
>>>>               res = ERR_PTR(-EOPENSTALE);
>>>>       } else if (!IS_ERR(res)) {
>>>>           inode = d_inode(res);
>>>>           if ((lookup_flags & LOOKUP_DIRECTORY) && inode &&
>>>> -            !S_ISDIR(inode->i_mode)) {
>>>> +            !(S_ISDIR(inode->i_mode) || S_ISLNK(inode->i_mode))) {
>>>>               dput(res);
>>>>               res = ERR_PTR(-ENOTDIR);
>>>>           } else if (inode && S_ISREG(inode->i_mode)) {
>>
>>
> 
> 
