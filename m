Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC1A2E847
	for <regressions@lists.linux.dev>; Mon,  4 Dec 2023 19:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vBbW9sIT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4715CC433C8;
	Mon,  4 Dec 2023 19:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701718793;
	bh=v0hxeE53Im98qOLtPcgC3UhqJldO4mtDYTuVCdwdeWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vBbW9sITzIkt+GSIhwCSDW9ytyY0rx2ct9sRR74OMQzoQZoEQsG00OK7oHhTWC6Yf
	 KquRaHJ14jJiFczWkTmT4ppOtMkIM90gWaREwg3nozFHHB9RVc18e1qGK31dCY79x8
	 eSJmRlSaV9ylAEKGEBl7ML9aaRJ6+EsezFP3lp6Tt/+/37Usm3qNWhy26XdCJAx1Ue
	 2HAjzkiinOR/VDpW1aVhXBfrE5IqWBEveZqOPdlzOk7D+MZaZEOlPi3nsGjjgZFNE6
	 hWk4tuIm7quOrjiWNPg0GElsHU6RLnfHv4akT9agooKr96CncRtbjTzSiu6TvuCBIG
	 enuQxNAriT3qA==
Date: Mon, 4 Dec 2023 14:39:51 -0500
From: Sasha Levin <sashal@kernel.org>
To: John Johansen <john.johansen@canonical.com>
Cc: =?iso-8859-1?Q?St=E9phane?= Graber <stgraber@stgraber.org>,
	Christian Brauner <brauner@kernel.org>,
	Aleksa Sarai <cyphar@cyphar.com>,
	Alexander Mihalicyn <alexander@mihalicyn.com>,
	regressions@lists.linux.dev
Subject: Re: Apparmor move_mount mediation breaks mount tool in containers
Message-ID: <ZW4rB9Q06nmb93ps@sashalap>
References: <CA+enf=sWQ+-YP+uj9XfN_ykDsK=CYFFa35aPpeuS9B6qyLkjtg@mail.gmail.com>
 <582eb2e9-ce80-4f96-a4bc-bef1a508e0ab@canonical.com>
 <CA+enf=u0UmgjKrd98EYkxFu7FYV8dR1SBYJn_1b0Naq=3twbbQ@mail.gmail.com>
 <fa2124b9-18c1-49b0-b390-398c2dde3fcf@canonical.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa2124b9-18c1-49b0-b390-398c2dde3fcf@canonical.com>

On Mon, Dec 04, 2023 at 05:14:11AM -0800, John Johansen wrote:
>On 12/3/23 17:34, Stéphane Graber wrote:
>>On Sun, Dec 3, 2023 at 8:21 PM John Johansen
>><john.johansen@canonical.com> wrote:
>>>
>>>On 12/2/23 17:20, Stéphane Graber wrote:
>>>>Hey John,
>>>>
>>>>Upstream commit 157a3537d6bc28ceb9a11fc8cb67f2152d860146 which just
>>>>landed in 6.6.3 stable as 96af45154a0be30485ad07f70f852b1456cb13d7 is
>>>>blocking new mounts for all LXC, LXD and Incus users (at least) on
>>>>distributions using the newer version of util-linux.
>>>>
>>>>That's because for a simple mount like "mount -t tmpfs tmpfs /tmp",
>>>>the new mount command now performs:
>>>>```
>>>>fsconfig(3, FSCONFIG_SET_STRING, "source", "tmpfs", 0) = 0
>>>>fsconfig(3, FSCONFIG_CMD_CREATE, NULL, NULL, 0) = 0
>>>>fsmount(3, FSMOUNT_CLOEXEC, 0)          = 4
>>>>statx(4, "", AT_STATX_SYNC_AS_STAT|AT_EMPTY_PATH, STATX_MNT_ID,
>>>>{stx_mask=STATX_BASIC_STATS|STATX_MNT_ID,
>>>>stx_attributes=STATX_ATTR_MOUNT_ROOT, stx_mode=S_IFDIR|S_ISVTX|0777,
>>>>stx_size=40, ...}) = 0
>>>>move_mount(4, "", AT_FDCWD, "/tmp", MOVE_MOUNT_F_EMPTY_PATH) = 0
>>>>```
>>>>
>>>>That last call to "move_mount" is incorrectly interpreted by AppArmor
>>>>as an attempt to move-mount "/" to "/mnt" rather than as a new mount
>>>>being created, this therefore results in:
>>>>```
>>>>Dec 03 01:05:03 kernel-test kernel: audit: type=1400
>>>>audit(1701565503.599:34): apparmor="DENIED" operation="mount"
>>>>class="mount" info="failed perms check" error=-13
>>>>profile="incus-a_</var/lib/incus>" name="/tmp/" pid=2190 comm="mount"
>>>>srcname="/" flags="rw, move"
>>>>```
>>>>
>>>>Note that the flags here show "move", the fstype isn't even set and
>>>>the source path at srcname incorrectly shows "/".
>>>>
>>>>This operation therefore trips any container manager which has an
>>>>apparmor security policy preventing arbitrary move-mount (as those
>>>>could be used to bypass other apparmor path based policies).
>>>>
>>>>
>>>>The way I see it, the current mediation support effectively breaks any
>>>>attempt at mediating mounts in a useful way in apparmor as it's now
>>>>impossible to mediate new mounts based on their fstype or even
>>>>distinguish them from a move-mount operation.
>>>>
>>>Indeed it is a far from good solution. It is a stop gap.
>>>>
>>>>I don't know if this warrants pulling the mediation patch out of
>>>>stable (and out of linus' tree), obviously doing that would
>>>>reintroduce that hole in mount coverage, but at the same time, the
>>>>current coverage is broken enough that our only alternative is to
>>>>effectively allow all mounts, making the current mediation useless.
>>>
>>>pulling it effectively means ALL applications by-pass mediation, the
>>>alternative is to block all applications from using the move_mount
>>>system call as part of mediation. Which might have been acceptable
>>>as a stop gap when the syscall first landed but not now.
>>
>>Pulling it from the stable branch may still make sense, you now have
>>folks who are updating to get actual bugfixes and end up with broken
>>containers, that doesn't exactly seem like a good outcome...
>>
>
>I will defer such a decision to the maintainers the stable trees. I
>can see arguments either way.

This decision isn't up to the stable tree: we want to stay "bug
compatible" with upstream, and thus if this issue also exists upstream
(and it sounds like it does), we'll keep this patch in the stable trees.

If a revert was to be submitted to Linus, we'll take the same revert to
the stable trees.

-- 
Thanks,
Sasha
