Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DD324B30
	for <regressions@lists.linux.dev>; Mon,  4 Dec 2023 13:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="tU9tOgWB"
Received: from [192.168.192.84] (unknown [50.39.103.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 197C53F282;
	Mon,  4 Dec 2023 13:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701695655;
	bh=uuh1IVmAnwV7nfJHWCjLmOiQsANfxnczHtvziYnWfLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=tU9tOgWBz79y7wDWAZICya6+zb5ojGhKJhZgdK8LR5OSunKuz3VL/DgT2inSb5UCl
	 +HsIc/ceB0jKnHJkg71cDsDdOvfBAPdZ6rcRXlzJ8TEz0okRJmI8f0EjQ3Sel5HVXG
	 R12V1v8UmSVJmcWLDhMhGL5vHzReVKkRCmv/Q6ewCqf9hQKFQ9VsPvcuZWGyr10vwS
	 obuf+ydGZQbGaWyiNgQXGL6XBNL9rWVBrXQm9p4AsLqsFn+84RPGRDrnO+UGTy2srL
	 rCqXv2OUhTQJpZL0WzGDx6ZzG85XkXezI1UbUVYMFSes2iezVzG+sEfRqdRylY1ARv
	 OeKdEfLuQQCqA==
Message-ID: <fa2124b9-18c1-49b0-b390-398c2dde3fcf@canonical.com>
Date: Mon, 4 Dec 2023 05:14:11 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Apparmor move_mount mediation breaks mount tool in containers
Content-Language: en-US
To: =?UTF-8?Q?St=C3=A9phane_Graber?= <stgraber@stgraber.org>
Cc: Christian Brauner <brauner@kernel.org>, Sasha Levin <sashal@kernel.org>,
 Aleksa Sarai <cyphar@cyphar.com>,
 Alexander Mihalicyn <alexander@mihalicyn.com>, regressions@lists.linux.dev
References: <CA+enf=sWQ+-YP+uj9XfN_ykDsK=CYFFa35aPpeuS9B6qyLkjtg@mail.gmail.com>
 <582eb2e9-ce80-4f96-a4bc-bef1a508e0ab@canonical.com>
 <CA+enf=u0UmgjKrd98EYkxFu7FYV8dR1SBYJn_1b0Naq=3twbbQ@mail.gmail.com>
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <CA+enf=u0UmgjKrd98EYkxFu7FYV8dR1SBYJn_1b0Naq=3twbbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/3/23 17:34, Stéphane Graber wrote:
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

I will defer such a decision to the maintainers the stable trees. I
can see arguments either way.

But I will note that even if we had been able perfectly match the
new interface mediation to the old breakage is still possible because
containers could have been using new interface to do things not
covered by the old interface rules.

Not that it matters to the upstream kernel maintainers but a CVE
is coming for this and that having this unmediated in the tree isn't
good either.

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

Only in the sense that closing a security regression causes breakage.

Lets cover the cases.
Policy is not updated, and application uses the old mount interface:
this continues to work.

*Policy is not updated, and application uses the new mount interface:
the access is likely blocked (the security hole has been closed)
unless the policy already allowed a generic
   allow mount,

+Policy is updated with generic
   allow mount,
and application uses the old mount interface:
this continues to work, security restrictions are reduced on the
old interface, but policy reflects what can actually be enforced
around mount, because if the application is compromised and uses
the new mount interface this is what can be mediated.

Policy is updated with generic
   allow mount,
and application uses the new mount interface:
The application continues to work.

* The breakage case is where the application was using the new
interface and not being mediated. While being able to mediate
the new interface to the same level of the old would help, it
does not guarantee this case won't break, as the application
could be using to do things that are not restricted by current
policy.

+ The regressed mediation case, is only sort of reduced mediation.
The policy can maintain all existing mount rules so that info
is not lost going forward.
The mediation on the old mount interface is reduced by the new
mount rule, but at the same time it now possible to turn of
the new mount interface, if mount is not being used by the
application.

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

having a toggle to turn off mount is sane. It actually is a little
better than that in that you can do more with some cases. It still
allows full mediation under the old interface, it just can't match
how fine the mediation is with the old interface.

> That seems very odd, at that point, why not instead upstream a patch
> that disables the new mount API when apparmor is in use with mount
> rules?

It breaks applications, some will fallback, some don't. Here you
get a policy controllable toggle. Admittedly it returns -EACCES
instead of a different error code but that could be adjusted.

> That feels like it would have had the same theoretical benefits
> without the breakage that this change caused.
> 
I am willing to experiment with this more but it can break
applications.

>> But the reality is, apparmor won't be able to achieve equivalent
>> mediation without new hooks or at least more mount context passed
>> into the existing hook. That to is being looked at but won't be
>> is even further out.
> 
> That doesn't sound encouraging as far as getting a suitable fix to our users...
> 
If by suitable fix you mean equivalence of mediation between the
old and new interface, not in the short term.

> 
> Is there even a way in apparmor policies to cleanly prevent the use of
> the new mount API (return ENOSYS back to userspace)?

Its possible, it will take another patch or two kernel side for this
case. We could even add a boolean and make it so you can apply mount
rules specifically only to the old or new interface.

> We can obviously do this through a separate seccomp filter, but not
> everyone is using seccomp...
> 
> Stéphane

