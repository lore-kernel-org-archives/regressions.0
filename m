Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C6F405DE
	for <regressions@lists.linux.dev>; Tue,  5 Dec 2023 12:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rAUTU-0000v6-HL; Tue, 05 Dec 2023 13:24:28 +0100
Message-ID: <a5efccec-9017-44db-924a-3c78e0337b76@leemhuis.info>
Date: Tue, 5 Dec 2023 13:24:28 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Apparmor move_mount mediation breaks mount tool in containers
Content-Language: en-US, de-DE
To: regressions@lists.linux.dev
References: <CA+enf=sWQ+-YP+uj9XfN_ykDsK=CYFFa35aPpeuS9B6qyLkjtg@mail.gmail.com>
 <582eb2e9-ce80-4f96-a4bc-bef1a508e0ab@canonical.com>
 <CA+enf=u0UmgjKrd98EYkxFu7FYV8dR1SBYJn_1b0Naq=3twbbQ@mail.gmail.com>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CA+enf=u0UmgjKrd98EYkxFu7FYV8dR1SBYJn_1b0Naq=3twbbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1701779071;70a9fe73;
X-HE-SMSGID: 1rAUTU-0000v6-HL

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

Below issue is already discussed, but to ensure it does not fall through
the cracks let me add this to the tracking:

#regzbot ^introduced 157a3537d6bc28ceb9a11fc8cb67f2152d
#regzbot title apparmor: move_mount mediation breaks mount tool in
containers
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

On 04.12.23 02:34, Stéphane Graber wrote:
> On Sun, Dec 3, 2023 at 8:21 PM John Johansen
> <john.johansen@canonical.com> wrote:
>>
>> On 12/2/23 17:20, Stéphane Graber wrote:
>>> Hey John,
>>>
>>> Upstream commit 157a3537d6bc28ceb9a11fc8cb67f2152d860146 which just
>>> landed in 6.6.3 stable as 96af45154a0be30485ad07f70f852b1456cb13d7 is
>>> blocking new mounts for all LXC, LXD and Incus users (at least) on
>>> distributions using the newer version of util-linux.
>>>
>>> That's because for a simple mount like "mount -t tmpfs tmpfs /tmp",
>>> the new mount command now performs:
>>> ```
>>> fsconfig(3, FSCONFIG_SET_STRING, "source", "tmpfs", 0) = 0
>>> fsconfig(3, FSCONFIG_CMD_CREATE, NULL, NULL, 0) = 0
>>> fsmount(3, FSMOUNT_CLOEXEC, 0)          = 4
>>> statx(4, "", AT_STATX_SYNC_AS_STAT|AT_EMPTY_PATH, STATX_MNT_ID,
>>> {stx_mask=STATX_BASIC_STATS|STATX_MNT_ID,
>>> stx_attributes=STATX_ATTR_MOUNT_ROOT, stx_mode=S_IFDIR|S_ISVTX|0777,
>>> stx_size=40, ...}) = 0
>>> move_mount(4, "", AT_FDCWD, "/tmp", MOVE_MOUNT_F_EMPTY_PATH) = 0
>>> ```
>>>
>>> That last call to "move_mount" is incorrectly interpreted by AppArmor
>>> as an attempt to move-mount "/" to "/mnt" rather than as a new mount
>>> being created, this therefore results in:
>>> ```
>>> Dec 03 01:05:03 kernel-test kernel: audit: type=1400
>>> audit(1701565503.599:34): apparmor="DENIED" operation="mount"
>>> class="mount" info="failed perms check" error=-13
>>> profile="incus-a_</var/lib/incus>" name="/tmp/" pid=2190 comm="mount"
>>> srcname="/" flags="rw, move"
>>> ```
>>>
>>> Note that the flags here show "move", the fstype isn't even set and
>>> the source path at srcname incorrectly shows "/".
>>>
>>> This operation therefore trips any container manager which has an
>>> apparmor security policy preventing arbitrary move-mount (as those
>>> could be used to bypass other apparmor path based policies).
>>>
>>>
>>> The way I see it, the current mediation support effectively breaks any
>>> attempt at mediating mounts in a useful way in apparmor as it's now
>>> impossible to mediate new mounts based on their fstype or even
>>> distinguish them from a move-mount operation.
>>>
>> Indeed it is a far from good solution. It is a stop gap.
>>>
>>> I don't know if this warrants pulling the mediation patch out of
>>> stable (and out of linus' tree), obviously doing that would
>>> reintroduce that hole in mount coverage, but at the same time, the
>>> current coverage is broken enough that our only alternative is to
>>> effectively allow all mounts, making the current mediation useless.
>>
>> pulling it effectively means ALL applications by-pass mediation, the
>> alternative is to block all applications from using the move_mount
>> system call as part of mediation. Which might have been acceptable
>> as a stop gap when the syscall first landed but not now.
> 
> Pulling it from the stable branch may still make sense, you now have
> folks who are updating to get actual bugfixes and end up with broken
> containers, that doesn't exactly seem like a good outcome...
> 
>> The situation can be broken down like this
>> unconfined applications have no restrictions, this doesn't affect
>> hem.
>>
>> confined applications using the old mount interface continue to
>> work as expected.
>>
>> confined applications using the new mount interface now are blocked
>> unless there is, admittedly, a very broad mount rule granted. This
>> is however better than the old situation in which confined
>> applications where not mediated at all.
> 
> It depends from your point of view. If you are using apparmor around a
> single application and have tailored rules for exactly what it is
> doing, then yes, I agree.
> But for all cases where apparmor is used as a safety net to block
> potentially dangerous/problematic actions, this is causing the kind of
> breakage which will cause people to just plain turn off apparmor.
> 
>> The regression is in the policy, where an application like LXD/Incus
>> are specify mount rules and loading policy based on it. Those
>> restrictions continue to work on the old mount interface, they
>> however do not work as one would expect when the new mount interface
>> is used. To allow applications to use the new mount interface
>> a broad mount rule is needed, which basically makes the other
>> mount restrictions useless.
>>
>> This situation is however still better than without the patch
>> because, applications trying to use the new mount interface
>> were not restricted at all. The only regression is in mediation
>> of applications that are using the old mount interface. But
>> again those application, without the patch, can just use the
>> new interface and by-pass the restrictions from those rules. In
>> this case the broad rule is not good, but better than the by-pass.
>>
>> I am working on a patch that will improve the situation, over the
>> current patch using the existing move_mount hook. I wanted to
>> be able to get more testing in place, before we did more, and
>> just didn't have the time.
> 
> So just to understand, this change went upstream while it was known
> that effectively no sane mount policy would work with it?
> 
> That seems very odd, at that point, why not instead upstream a patch
> that disables the new mount API when apparmor is in use with mount
> rules?
> That feels like it would have had the same theoretical benefits
> without the breakage that this change caused.
> 
>> But the reality is, apparmor won't be able to achieve equivalent
>> mediation without new hooks or at least more mount context passed
>> into the existing hook. That to is being looked at but won't be
>> is even further out.
> 
> That doesn't sound encouraging as far as getting a suitable fix to our users...
> 
> 
> Is there even a way in apparmor policies to cleanly prevent the use of
> the new mount API (return ENOSYS back to userspace)?
> We can obviously do this through a separate seccomp filter, but not
> everyone is using seccomp...
> 
> Stéphane
> 
> 
