Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23B5372EC0
	for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 10:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776854911; cv=pass; b=MBkYrAQMO6uKHd8r0MDvbcX1kbzQhoUbegcF5dC6AVOO2uxV4e1DNAm2+DZyeDdKDa3PFBHkql14cokvSl23r0WiFcoz0IjWG6k6rsPw+ZYwe7S/hzaL7hhSKXzTnFtzSFXCde2R9ed8YcYEGKCnNhNqW+DzplWDqiijwTR5pIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776854911; c=relaxed/simple;
	bh=HC3rY3uXKufs5x8TSWVlo+xZYqdzjTzyAYbVH1Cr2Gc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WnAaemPd1dgEsh7ULQ4x6HxK0hdH1WWdsaP8BtI31jfeAbnoK63o3IlXCuhnrncn6HcTeT9pXcL4GEKWWyXhbFPAzocH4OjUH6HNZnAyMy8nmjFe4Rzb1uyAsqLCGNnHI6htS4Xz/VfnlletJPw3Cp3t+bTtExDgdMtpG8JmUmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkhYh778; arc=pass smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkhYh778"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7dcdd1b492eso1334248a34.1
        for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 03:48:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776854909; cv=none;
        d=google.com; s=arc-20240605;
        b=OIreZRvC7Jvg9uYsIZobgiQTS3gANldKLRNINDOGIZSKpm8FmREi+njYeF4FgNY9ni
         h7zaSHc1LuG7t9IERwd+66JshyLme5FOd0QqH91NqXw+3pxjwc4VL6ksDAw+WGaYxute
         RS593kxF0BP2FK8pxBqlZaq8JjOFqrgZ2P82J38UMmIr/V9FN1c0ysjVNUwLXbxqny/p
         DiBA/5Ubcv5axu8ZT1NAvOtP5AiizVZ5yv3ltQlNEOfWGytouPNYjdyc6qc2AtG9rnyW
         SAFnu2yxK59wX+rbuKLU/Y6ZC+edCLDmbypd6NkD/BSxrQ6aD6iVc+s/jCuA1wP+gHa4
         FtYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UivcjijB7warL/u9OhnklUtKOOOqB4M7a7P2qVL9zFM=;
        fh=1z/CqFKKXJTyR6fG6k/Q47qDrMCGNgNZ6GnS2ZvSFcU=;
        b=IEQJpoKY48OI2nZ4q9iij9+3UVQlITTBzPyHMzX+QOr/tI0lXTsTkbev6Rdf/jI0z/
         uFaHtrjZwo2rfmjDydW2SmhwxZrLzefHb2CN5e+LMaOtysI25cq0RatX6WEHwWbZbfq5
         /SATqXrDfOIHJuHlOobWoCZMjLsTfzMcw4Kyw1jWXcRl1cTiNt33gx6BEvaygOGTsuFE
         QY4omLFDnyxMRoG6HLV1UEEYPnmzda+kH5ZSqMLJTP/RKsbqI9F5qg2SKRUTaxi4ZsTz
         oiZuI9HoDcgwYwxWXWqil6lgHmcUz63ijABdm1QmD4EcRCQt5hqPOAXFLXHcnrr74pjH
         48rg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776854909; x=1777459709; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UivcjijB7warL/u9OhnklUtKOOOqB4M7a7P2qVL9zFM=;
        b=CkhYh778CcinSt5ftx2u3CnLx8IvqEM+BneM6X5a9DwVj28mSN3+eRQioAzkRxSsj4
         XQDKXgDa958aRW65NrMWUyOvz4fi4w3Km9k7qBLjfMgex7EiXey6A1BUMbCs+ZVsZ/Li
         tWiBVafHeHrqhJI6qxBhfzrPe8JW34S0mQHwx++H5JAuAV8oVkbzommUJE453bBAy3UF
         1txmjzjFzCNGrnl6lnlRGXi2e7qlySDeESJCTPcwMNRKpBv3OwfFFJt1Q4n/xQ6Y4UT+
         KHBhW+S+C/Jcaqob5H0Mig8mxEhnIgSEBHgRl1aiKDLjgI8FY3If8pdeQWn+o9iv2rsB
         etsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776854909; x=1777459709;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UivcjijB7warL/u9OhnklUtKOOOqB4M7a7P2qVL9zFM=;
        b=O6xSHvc6g9CyqA+NNeAIBVe+/vvrZ0cdx/LTP0wwoWW65y5z9UFQlRSdUfypeqiFMg
         /1CzrzdIrFAiJY50oY+dZUEff3l4CbhzXC94N6SO547nrNys5bUdReNnxbsRWAFSAMyN
         VXnpg9RgAivPVW80p0qAiK7cfIB3+NMA0poa9mX9FpBWfilgOGQBUEq6tOOW5dzhCEtQ
         WEww4eq7zhTlX51WamDXUbVJhK5qJCN4YosyMr6A5avMOEoK7c8kytxsN1REcALffU+E
         bqWq8aiPWRw/B767X8v4wIwTZUXdKDHrJk8JG00jQEUlXu+eePUr1tmNsBzEtiTEkWmc
         G7FA==
X-Forwarded-Encrypted: i=1; AFNElJ8+2aHHl6gqbWB3Au2W8UxXk+L+5DHTTwioH3lZMj56lJ8SZsmh2WcMVhzyAad3iuhKkszjyP4JyV7YvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjxTvnymJopX/hA3eGE6Ob/u7z+eou36kKNHdCTJRULeyHPQjs
	5G4j8he/LAKuJ0tI3tJu/+yltOnYRDTMdDYgXOar0TxZsWhO5TMIEDJitevc7A1Z2xenXWMDTS/
	9bkf5/lPmMP/VSLGmyNpZH/SljYnSrAw=
X-Gm-Gg: AeBDietjtObrSiY8uMpkoArAJmgsGs8u1I6s1BeHaJQ9paO2yMXrTpxpuGwmQhbPuy9
	FxbcHosCHjb6iSXwAs46NU1KmbAlb5EUs5WasYiCh3zG09b0gxvrTQBW4hyCmXoCzjt+zh5qhYI
	2RneFVQRdT2fk1QC8OhRN/oFvTMTIiWp4y8xcwy2NA8b4DS6kwiKlmWGq6pPstc5f0Tam5JCTJ3
	cOR4dl1MJhv0CCiMIgjAFwv3Yibi0/wh+EOU8Di3JtW6afQwzNgznrzlFnhQPfIImtlbrgx1gYp
	RW3o3TIqx2uxOhfAWzjxinrsIhIm
X-Received: by 2002:a05:6830:6d42:b0:7d7:fd71:f2d4 with SMTP id
 46e09a7af769-7dc954b4c7amr11686568a34.3.1776854908754; Wed, 22 Apr 2026
 03:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsPdTyd_79sXZFJEBqYDXGxH3mXXwvhRCagNWzzNGrKt=w@mail.gmail.com>
 <20260421135332.GC1064669@noisy.programming.kicks-ass.net> <20260421144105.GA3179637@noisy.programming.kicks-ass.net>
In-Reply-To: <20260421144105.GA3179637@noisy.programming.kicks-ass.net>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 22 Apr 2026 15:48:16 +0500
X-Gm-Features: AQROBzDFtypzzW58THyLMGhc1ELG9l-zPrkfjpc6sVGwT9F0dLE04fudyXPQQos
Message-ID: <CABXGCsO5fKq2nD9nO8yO1z50ZzgCPWqueNXHANjntaswoOh2Dg@mail.gmail.com>
Subject: Re: [REGRESSION] sched/core merge 1c3b68f0d55b: futex_waitv lost
 wakeup hangs RE Engine games and PID 1 init
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Waiman Long <longman@redhat.com>, John Stultz <jstultz@google.com>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000a77f5206500a45f0"

--000000000000a77f5206500a45f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 7:41=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:>
> Specifically, see this thread:
>
>   https://lore.kernel.org/r/95651a71-1adf-45ba-83eb-5744bc6d4a52@amd.com

You're right =E2=80=94 it is to blame, and I was about to follow up to say =
so.

After sending the first mail I kept re-verifying markers with the
stricter RE2+RE9 workload and found that 33c66eb5e984 (parent 1 of
1c3b68f0, which I had marked "good") actually reproduces the hang too.
A third bisect run with the stricter workload converges unambiguously
on:

  25500ba7e77c ("locking/mutex: Remove the list_head from struct mutex")

Parent b9bdd4b68404 ("locking/semaphore: Remove the list_head from struct
semaphore"): good. 25500ba7e77c: bad.

So the "semantic conflict in sched/core merge" framing in my original
mail was wrong; the regression is in the mutex wait-list rework, which
is exactly where you pointed. The ww_mutex breakage fits the symptoms
very well =E2=80=94 RE Engine games go through DXVK -> RADV -> amdgpu, whic=
h
leans on ww_mutex via drm_exec for reservation objects, and the
userspace-visible effect is the render thread waiting forever on
futex_waitv for a submit that never completes. init startup similarly
exercises DRM reservation locks early, which explains the PID 1 variant.

Third bisect log attached. Full revert of 25500ba7e77c on current
master conflicts with later commits in the same series (rwsem/rtmutex
list_head removal, spinlock context analysis), so I couldn't test a
single-commit revert in isolation, but the bisect is clean.

Thanks for the pointer to
https://lore.kernel.org/r/95651a71-1adf-45ba-83eb-5744bc6d4a52@amd.com
=E2=80=94 I'll read that thread and happy to test any candidate fix against
the RE2/RE9 repro.

Apologies for the bogus first-bad in the original mail.

Note for regzbot: the earlier #regzbot introduced: 1c3b68f0d55b in this
thread was based on a bisect that converged on the wrong commit due to
a false-negative "good" marker. Re-bisecting with a stricter workload
identified the actual first-bad as 25500ba7e77c. Updating below.

#regzbot introduced: 25500ba7e77ce9d3d9b5a1929d41a2ee2e23f6fe
#regzbot title: RE Engine games and PID 1 init hang in futex_waitv
after mutex list_head removal

--=20
Thanks,
Mikhail

--000000000000a77f5206500a45f0
Content-Type: text/plain; charset="US-ASCII"; name="bisect-log-third-run.txt"
Content-Disposition: attachment; filename="bisect-log-third-run.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mo9xfqyt0>
X-Attachment-Id: f_mo9xfqyt0

Z2l0IGJpc2VjdCBzdGFydAojIHN0YXR1czogd2FpdGluZyBmb3IgYm90aCBnb29kIGFuZCBiYWQg
Y29tbWl0cwojIGdvb2Q6IFswMjhlZjljOTZlOTYxOTcwMjY4ODdjMGYwOTI0MjQ2NzkyOThhYWU4
XSBMaW51eCA3LjAKZ2l0IGJpc2VjdCBnb29kIDAyOGVmOWM5NmU5NjE5NzAyNjg4N2MwZjA5MjQy
NDY3OTI5OGFhZTgKIyBiYWQ6IFsxZjVmZmM2NzIxNjVmZjg1MTA2M2E1ZmQwNDRiNzI3YWIyNTE3
YWUzXSBGaXggbWlzbWVyZ2Ugb2YgdGhlIGFybTY0IC8gdGltZXItY29yZSBpbnRlcnJ1cHQgaGFu
ZGxpbmcgY2hhbmdlcwpnaXQgYmlzZWN0IGJhZCAxZjVmZmM2NzIxNjVmZjg1MTA2M2E1ZmQwNDRi
NzI3YWIyNTE3YWUzCiMgc2tpcDogW2VlNjBjNTEwZmIzNDY4ZWM2ZmFiOTg0MTkyMThjNGU3YjM3
ZTJjYTNdIE1lcmdlIHRhZyAnbm9saWJjLTIwMjYwNDEyLWZvci03LjEtMScgb2YgZ2l0Oi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25vbGliYy9saW51eC1ub2xpYmMK
Z2l0IGJpc2VjdCBza2lwIGVlNjBjNTEwZmIzNDY4ZWM2ZmFiOTg0MTkyMThjNGU3YjM3ZTJjYTMK
IyBnb29kOiBbMWY5MDE3ZDE5ZGIzOGFkMmNiOWJlZGI1YjA3OGY2ZjRmNjBhZmE5NF0gd2lmaTog
bXQ3NjogbXQ3OTk2OiBmaXggcXVldWUgcGF1c2UgYWZ0ZXIgc2NhbiBkdWUgdG8gd3JvbmcgY2hh
bm5lbCBzd2l0Y2ggcmVhc29uCmdpdCBiaXNlY3QgZ29vZCAxZjkwMTdkMTlkYjM4YWQyY2I5YmVk
YjViMDc4ZjZmNGY2MGFmYTk0CiMgYmFkOiBbMzNjNjZlYjVlOTg0NDQyOTkxMWJmNTQ3OGM5NmM2
MGY5ZjhhZjlkMF0gTWVyZ2UgdGFnICdwZXJmLWNvcmUtMjAyNi0wNC0xMycgb2YgZ2l0Oi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RpcC90aXAKZ2l0IGJpc2VjdCBi
YWQgMzNjNjZlYjVlOTg0NDQyOTkxMWJmNTQ3OGM5NmM2MGY5ZjhhZjlkMAojIGdvb2Q6IFtjZWE0
YTkwZmFmOWU1ZDE1YWVlMWZkMDE4ODNiYzgxYWQ3NjQwMjYwXSBNZXJnZSB0YWcgJ3NlY2NvbXAt
djcuMS1yYzEnIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9rZWVzL2xpbnV4CmdpdCBiaXNlY3QgZ29vZCBjZWE0YTkwZmFmOWU1ZDE1YWVlMWZkMDE4ODNi
YzgxYWQ3NjQwMjYwCiMgZ29vZDogW2Q2MGJjMTQwMTU4MzQyNzE2ZTEzZmYwZjhhYTY1NjQyZjQz
YmEwNTNdIE1lcmdlIHRhZyAncHdyc2VxLXVwZGF0ZXMtZm9yLXY3LjEtcmMxJyBvZiBnaXQ6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYnJnbC9saW51eApnaXQgYmlz
ZWN0IGdvb2QgZDYwYmMxNDAxNTgzNDI3MTZlMTNmZjBmOGFhNjU2NDJmNDNiYTA1MwojIGdvb2Q6
IFtkYjIzOTU0ZWVhZjIzNDY0NjY5MDQzZGRiYjM4YTY0ZjdiMzAxZWJkXSBNZXJnZSB0YWcgJ2ly
cS1jb3JlLTIwMjYtMDQtMTInIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC90aXAvdGlwCmdpdCBiaXNlY3QgZ29vZCBkYjIzOTU0ZWVhZjIzNDY0NjY5MDQz
ZGRiYjM4YTY0ZjdiMzAxZWJkCiMgZ29vZDogW2MxZmU4NjdiNWJmOWM1N2FiNzg1NjQ4NmQzNDI3
MjBlMmIyMDVlZWRdIE1lcmdlIHRhZyAndGltZXJzLWNvcmUtMjAyNi0wNC0xMicgb2YgZ2l0Oi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RpcC90aXAKZ2l0IGJpc2Vj
dCBnb29kIGMxZmU4NjdiNWJmOWM1N2FiNzg1NjQ4NmQzNDI3MjBlMmIyMDVlZWQKIyBnb29kOiBb
ZTgwZDAzMzg1MWIzYmM5NGMzZDI1NGFjNjY2NjBkZGQwYTQ5ZDcyY10gTWVyZ2UgdGFnICdzbXAt
Y29yZS0yMDI2LTA0LTEyJyBvZiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvdGlwL3RpcApnaXQgYmlzZWN0IGdvb2QgZTgwZDAzMzg1MWIzYmM5NGMzZDI1NGFj
NjY2NjBkZGQwYTQ5ZDcyYwojIGJhZDogWzczOTNmZWJjYjFiMjA4MmMwNDg0OTUyNzI5Y2JlYmZl
NGRjNTA4ZDVdIE1lcmdlIHRhZyAnbG9ja2luZy1jb3JlLTIwMjYtMDQtMTMnIG9mIGdpdDovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90aXAvdGlwCmdpdCBiaXNlY3Qg
YmFkIDczOTNmZWJjYjFiMjA4MmMwNDg0OTUyNzI5Y2JlYmZlNGRjNTA4ZDUKIyBnb29kOiBbMWVh
NGI0NzM1MDRiNmRjNmEwZDIxYzI5ODUxOWFmZjJkNTI0MzNjOV0gbG9ja2luZy9yd3NlbTogUmVt
b3ZlIHRoZSBsaXN0X2hlYWQgZnJvbSBzdHJ1Y3Qgcndfc2VtYXBob3JlCmdpdCBiaXNlY3QgZ29v
ZCAxZWE0YjQ3MzUwNGI2ZGM2YTBkMjFjMjk4NTE5YWZmMmQ1MjQzM2M5CiMgYmFkOiBbNjhiY2Q4
YjZlMGIxMGQ5MDJmN2ZjOGJmM2YwOGYzMzVmNWQxNjQwZV0gbG9ja2luZy9yd3NlbTogRml4IGxv
Z2ljIGVycm9yIGluIHJ3c2VtX2RlbF93YWl0ZXIoKQpnaXQgYmlzZWN0IGJhZCA2OGJjZDhiNmUw
YjEwZDkwMmY3ZmM4YmYzZjA4ZjMzNWY1ZDE2NDBlCiMgYmFkOiBbOTBiYjY4MWRjZGY3ZTY5Yzkw
YjU2YTE4ZjA2YzAzODlhMDgxMGI5Ml0gbG9ja2luZy9ydG11dGV4OiBBZGQgY29udGV4dCBhbmFs
eXNpcwpnaXQgYmlzZWN0IGJhZCA5MGJiNjgxZGNkZjdlNjljOTBiNTZhMThmMDZjMDM4OWEwODEw
YjkyCiMgYmFkOiBbMDc1NzRiOGViYWFjNzkyN2UyMzU1YjRmMzQzYjAzYjUwZTA0NDk0Y10gY29t
cGlsZXItY29udGV4dC1hbmFseXN5czogQWRkIF9fY29uZF9yZWxlYXNlcygpCmdpdCBiaXNlY3Qg
YmFkIDA3NTc0YjhlYmFhYzc5MjdlMjM1NWI0ZjM0M2IwM2I1MGUwNDQ5NGMKIyBiYWQ6IFsyNTUw
MGJhN2U3N2NlOWQzZDliNWExOTI5ZDQxYTJlZTJlMjNmNmZlXSBsb2NraW5nL211dGV4OiBSZW1v
dmUgdGhlIGxpc3RfaGVhZCBmcm9tIHN0cnVjdCBtdXRleApnaXQgYmlzZWN0IGJhZCAyNTUwMGJh
N2U3N2NlOWQzZDliNWExOTI5ZDQxYTJlZTJlMjNmNmZlCiMgZ29vZDogW2I5YmRkNGI2ODQwNDU0
ZWY4N2Y2MWI2NTA2Yzk2MzVjNTdhODE2NTBdIGxvY2tpbmcvc2VtYXBob3JlOiBSZW1vdmUgdGhl
IGxpc3RfaGVhZCBmcm9tIHN0cnVjdCBzZW1hcGhvcmUKZ2l0IGJpc2VjdCBnb29kIGI5YmRkNGI2
ODQwNDU0ZWY4N2Y2MWI2NTA2Yzk2MzVjNTdhODE2NTAKIyBmaXJzdCBiYWQgY29tbWl0OiBbMjU1
MDBiYTdlNzdjZTlkM2Q5YjVhMTkyOWQ0MWEyZWUyZTIzZjZmZV0gbG9ja2luZy9tdXRleDogUmVt
b3ZlIHRoZSBsaXN0X2hlYWQgZnJvbSBzdHJ1Y3QgbXV0ZXgK
--000000000000a77f5206500a45f0--
