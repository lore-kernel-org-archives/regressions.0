Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE023876C3
	for <regressions@lists.linux.dev>; Wed,  2 Sep 2026 18:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372282; cv=pass; b=rvOvTqlhPcbKhUxLVVRhomcMGOUKkRci7FEmd6yfLYNCq0jFyXOtTcwO3C3kD2Ur4178V/JvamSOvTN5NrqCfDqgYyhqefdZU7PC79YYddOH9o5Qep6hghw8owBc3GjB05DOxsl55fQnrHuQ9CG3poZYLnqcEiNKWYqa65uOYdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372282; c=relaxed/simple;
	bh=AFJSrrQW4gF3ANdPDPC4j1IYpWV3iNda9Tgx0JK95J4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SNJRU5PLgExuYJWe7NxJx/wGc5mMmbd/RorO//fSk8uRnORxGri9LqLxMs5tqo+WwzGYSBmE87y9gTIqK3tHpG+ojzMEr6sgIi25DXiJNiDpoWL/y4VWz3lAW0XXHgXDlhI8ME/1Ni0loJLKpvBrjaBVWXFI9sLLc8wR6daax7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p3e3fNkk; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p3e3fNkk"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff390a6aso79045ad.0
        for <regressions@lists.linux.dev>; Wed, 02 Sep 2026 11:04:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788372280; cv=none;
        d=google.com; s=arc-20260327;
        b=DcBgfNkY9KFRvqbXPJvl+UNQ7mKg8XTepkMJMSEbyrsg+I87tiE3t4ll3G4IxSruzx
         XqgFWKN8M3A+0ZyTu+arXQA8ivwgj+ecAEUfV5heeON8YJs7VgxDABhCFXMeca1iioKn
         Z1BdZhtM6H3jEYxDXOWiiHpo+O7HToe0Igk2k6loCkgmUKoygyoOscYLCF85KwZPzOCr
         dwr75zgFmv3BN61HSh7VpipVxI+SuyCgqNnY+fJ4dLE0bRCJdGnr5AwJVl/RvisITbg1
         9PmXYhmQ6v7Hed8WctN9/uvrri5UX/ywWdPuLR/1cTXMftnLxLgKtM79TtbRNcAjmb0I
         JhwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tW+6wZzNoXEx9aEPCU1H6du91aF9vK1xV2VXmS0iwpM=;
        fh=2ciGioVsejSpE4eEHOMEFI7j/UtPysad429JzqMkIB4=;
        b=iKbIUHJzCU+aWAAD71QPeARd8MQS7j6zTLlvG7usM89fQC4A2aK3i6AXek+vokCqHO
         hjzA3Z4nWOSLvPe8Xa3TfRmw6D3yQ5cu3YzkEiQw7Q6B4MKklfh/VszNqkwjduWvWkCH
         XpexuUmLwSLuiW98zsZq/ZhxOIQcoP4GOFrolHBG9ny5KXGkyNw1PB4xa8Yf9598VoTA
         PO07OSMopWoHbZlGcYJdxotn4zBNMWL+GBd2l75kM9LjZ4OrS9kGGArA+egXSS0kgIJi
         ur9CyUcpeO5gHsY2VMX5kLTMfoGiDNP0ONCirXKg6jS3K8ge//Jd9hoHJH75FrZlaUhA
         ohMg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788372280; x=1788977080; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tW+6wZzNoXEx9aEPCU1H6du91aF9vK1xV2VXmS0iwpM=;
        b=p3e3fNkkpIwHJqB2O28KN+4PJIdcgk6uWH/uhTYAJ+taesGo8w1VLR5E5bhlWcFIYw
         2Kr6HlIPLoze47SWqZx5YVJi5x7yGG1ulT1BesuKVQaFjeJUyG+//6ltpsmCAhPcLRdX
         nZjh82NkeM5p/OFrtApHDY5VY5oKMTuZa6Dahoi7vGdqb7CSOY+Ga0XuHEnKXEGylmwL
         GGJzKd6i5hsZfTQ0jglwOJSigrl/DRsrh8nOqrHJ/vGIB85yIiUKHVq5BhElXLrUCWvC
         mKTogt4ExQl1/Ize0f8/Ep1iXNiEbwuLKg5/UNie/79nfNyIChMijIuQqvUogGD3cCkw
         G7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788372280; x=1788977080;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tW+6wZzNoXEx9aEPCU1H6du91aF9vK1xV2VXmS0iwpM=;
        b=ZKVHjCGVxkGgn4PbjZKNBwrPL5XP0/+mgtL4j+A+85WXhe96n4VBKDvb0yzVu9q5j7
         86AnQ8ArhX9Osld+PEnO+gG0mCuUitQQIol3MIL61o9liUKJv/TMXAfOltB1t2ABuvkr
         vFm7BZQoEXmeLV5su5c2b9iwcV+z2XnPdT/x3HHa9zauPPMWAVq8JvIcDtYk8GpvKF0u
         gznn1w3TB5U+2LEjBF3JDxzejCYqhD0w4sAkVUXQS1YLVoHlyClBNdNxjjcBErIex4ZS
         os6mY+rp+ttktPTReVSRIKlZn0MS8HmLHUEaDkH+RWVU+TlkvXk4L+M9GXjaQC9+pUDZ
         /79g==
X-Forwarded-Encrypted: i=1; AKwUvBz7y7r8t/zjNgKBKwiuxfV68EBGB8GakgfMUOQNyNhBEpDt0WNL58KrVD4/QMQELzkokgWsrjA7y/+9aA==@lists.linux.dev
X-Gm-Message-State: AFuF++nyQ+edocDHchb3aNBRNxOBryY1wPUa1keilSHH/TrnRS8Z69yR
	khP2m5BuyZT7nDobhOCoPBQGmEUZWzAaAyTmyH8UAIFTsITvQM7QOhYoKyj88q+rZoHQ5bbsHnd
	CLlT3HE7QYRosucC7xtQbfGoE/DvtimBOTM4tLIjQ
X-Gm-Gg: AYBFou1Q1S5LLHrtabpDLtw1qXYn3aIFnSbrcz/TrMym34hStcibPWkaXhYJm8WY3/t
	KA33bgySzyYHqseqlfB4yPjrN4B1lgOE9sH5rBfzr84WKzvvs26z29ipfztJQJD3XPE0wb6NBse
	AIfuA82bsHW7KKd+MWpAoXCuOweieTm+vAaKBjaJfXsMOzdOuV3x8za7zJBpRhEOFPL8rVgx8tX
	1IiHwkcoEgdyOmxU7ga2S/8ycthcZ9E2r9a1tglUrPJi1peiU5qGPXHCNmQZrlmTqYPNhIPo7Sj
	fPCWbmHD4Pjqgw7k/5kH7O6jnapYTUbN1y8K22mpEs4Li/ElFMHruJD4DYhWE11t79DffoohUE4
	3pI0nxY6GrIo312YICmHYYzc83gQ0qCA=
X-Received: by 2002:a17:902:d58f:b0:2ce:b436:272a with SMTP id
 d9443c01a7336-2dafc04d92amr701505ad.3.1788372279277; Wed, 02 Sep 2026
 11:04:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <f5e8166a-88be-46c5-8939-1e5227ffe4c2@app.fastmail.com>
In-Reply-To: <f5e8166a-88be-46c5-8939-1e5227ffe4c2@app.fastmail.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 2 Sep 2026 20:04:02 +0200
X-Gm-Features: AcwNN1UioYI-6aY2FlebIGmb7OnaSV6x_bEiOULXJCzjw3r7BAMamy4lB3uuGTY
Message-ID: <CAG48ez3AYt=dYMYLEEhkrzO740wNsD1_3zZbKqo7MXThqEA+Zg@mail.gmail.com>
Subject: Re: deadlock from exec_update_lock and reading procfs
To: Benjamin Peterson <benjamin@locrian.net>, regressions@lists.linux.dev
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Arjan van de Ven <arjan@linux.intel.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Jake Edge <jake@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 4:50=E2=80=AFPM Benjamin Peterson <benjamin@locrian.=
net> wrote:
> After receiving a kernel with 6650527444da ("proc: protect ptrace_may_acc=
ess() with exec_update_lock (part 1)"), we encountered a new deadlock in a =
FUSE server. The FUSE server reads /proc/PID/stat in the file flush callbac=
k, where PID is the pid of flushing process. This can deadlock in exec_upda=
te_lock acquisition when the flushing process is closing O_CLOEXEC files.

Ugh, sorry about that.

#regzbot ^introduced:  6650527444da

> Specifically, a process running execve is blocked with this stack:
>
> __schedule+0x505/0xc00
> schedule+0x27/0xc0
> request_wait_answer+0x158/0x2a0
> __fuse_simple_request+0xd7/0x290
> fuse_flush+0x1a4/0x1e0
> filp_flush+0x30/0x60
> filp_close+0x13/0x30
> do_close_on_exec+0x114/0x160
> begin_new_exec+0x553/0xb50
> load_elf_binary+0x2da/0x1770
> ? load_misc_binary+0x275/0x390 [binfmt_misc]
> bprm_execve+0x241/0x5f0
> do_execveat_common.isra.0+0x182/0x1c0
> __x64_sys_execve+0x36/0x40
> do_syscall_64+0x87/0x180
>
> while the FUSE server is blocked here:
>
> __schedule+0x505/0xc00
> schedule+0x27/0xc0
> schedule_preempt_disabled+0x15/0x30
> rwsem_down_read_slowpath+0x25c/0x480
> down_read_killable+0x48/0xc0
> do_task_stat+0x7f/0xec0
> proc_single_show+0x51/0xc0
> seq_read_iter+0x11f/0x460
> seq_read+0x12d/0x160
> vfs_read+0xe8/0x360
> ksys_read+0x6d/0xf0
> do_syscall_64+0x87/0x180
>
>
> This problems seems to have been acknowledged as a theoretical possibilit=
y in the original patch review thread [1]. Now that it's a practical proble=
m, is it feasible to move do_close_on_exec outside the scope of exec_update=
_lock?

I will take a look at this soon.

> Best regards, Benjamin
>
> [1] https://lore.kernel.org/all/CAG48ez2pmuoTCZh_AVKDDLeQEYmm=3DgLMgThnqF=
hRMFfZvABpdw@mail.gmail.com/
