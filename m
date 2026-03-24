Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA9634F48C
	for <regressions@lists.linux.dev>; Tue, 24 Mar 2026 07:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774338824; cv=pass; b=d5kQTvmsz3XS9w05CR1D0lNDmG1B2nM8Yq2dgaImabDmAsqXoeL3dx63OD0AfwfgBnMe4MC0CxHwJ1uz9CtBuODfZSCtwGJto53E6YTlOL6YfikUOncncu5LTELaxIsjUwPxsYQOvWB2vqnOQY5XhMnvwqjgY6Ov8DGulORE9IE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774338824; c=relaxed/simple;
	bh=EkHahqFiKzq0hXwxECnVuQUIAlqeYMLsbgChKFxta08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gck3FfdvLUmmneBbhQrWVEGIdw5TK0vzgCnccoAxqadNovhhDtst6eONfCPcMJWsaf9Bc3s7xVgu1FoivA5AWHVGlXgB2bePibmRyCBdOSmHSip12E5tMWwaTNT6nqsaro45cWK7kcuBq8a5HiW7q/rgPVYlzWFl3AOIJTrEjyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eI7ONrJk; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eI7ONrJk"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b886fc047d5so854710266b.3
        for <regressions@lists.linux.dev>; Tue, 24 Mar 2026 00:53:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774338811; cv=none;
        d=google.com; s=arc-20240605;
        b=N+0oAXulccudZPfQ4xiKZ6xMBmOtcZ4zVhGLl7bKJn5UEAOu13HSdAkNStc14Wvlyp
         omCCdoCUq74MtlK18ulTqGvpF5gZWYFKRnrZ7yV9Z+zk69iTbK34SmtASCE8kGFhHA+Z
         +Y8pTNTQPUvwCXQ+N8D0/q+ez1413T0LLdeiRvGGXGSm0yKisPOD2gez9LzyouB0pCij
         1NHB4Y54m6iFnPtmPnf560WmS9gfshqk2qIN05JQSVCTIqIsKw/27AOuwhiIgVovaOyi
         rHA6oTYk9cQTe6G4l6GF9eFA3IW7IuuwHOMEQ2ExtMEHEilxCD79LjcVyhikEy6GalB7
         qzrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BvlIol/fyMPbQwPX/OXsXdgiKOBBe/R83FLdoCNg1RY=;
        fh=xGBit5kndnOzk3xjF31STPsB3F8BaU5U7PFWGQTjBdg=;
        b=JKqBxQtE7plc0Ff5AKfx8Ep5/DPfuKrT+qqlD1mVnPWvBTUZieS7fFlUqiRWwrUcxr
         BGnzFcAiEugz2mOZiYjUeCQH9JPnVoyaxf8nxsXD/zCH9ngMVpO5uK1A72Y+siqHipik
         M2erI0MqIMJqdQo2/yx1QTKhW4p61sUeslxsXjzsTs9i4jKC9olrRxAxTqOdUBdkKk+l
         wGJhmpSAS2afjKqWwlseL0ff96bhXN+KThME0LcWZ6gGgYDmzfNP9VwhzOV0z5Yc5kE8
         FuZRkKrcr48V4tON0jjCVbZF1PT9UycR1cZPkvyw+eik/d6lyWF1gEugzujhGqRiMPAp
         2EYg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774338811; x=1774943611; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvlIol/fyMPbQwPX/OXsXdgiKOBBe/R83FLdoCNg1RY=;
        b=eI7ONrJkBb81k74qzQd9hPh3YRbNSuQihsCla7lazWgPzX1/dPeyurkERVqOR8Vy2Q
         01nPfWBK0rqzt4/jTMtZnXXjhFrGBKtxJ6Eb3Au9vaE8syMkVIJRDEMR054Uljlf3yci
         27VtNj2IOKFxy5lxKWxngSUJnzP4nZiIN8gO1jQ1fDQwqM1SI/oR4qq8YtHYz2o8heEN
         EBIeOX7TGvqfwYf7byhxpOQZDnAZDT1GEtueXSsSk7BEKypk38qk9WwWe8/H9N1lgpM7
         DW1jpq5ZGtSkHU2GSMvcuawa36vn7n6Avsu4HrjMq9xT6YtngB1eZkOwnBfJbnSKiXZ4
         IhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774338811; x=1774943611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BvlIol/fyMPbQwPX/OXsXdgiKOBBe/R83FLdoCNg1RY=;
        b=fqo/W4idjQlX8YzqK63U5Qk4QOu3wmwiBcDHCYl2P+YfHkQpRWKSAP9aG39+dtZ4Lx
         L+RSQSzoASJXe631BsErVJ2F9oDcQEOYTxs8lbhQfahKvuYoJWU/8o6di7S4KLrbNUCa
         cX/ruM5Vkm43N+9sMapFbG65xnWhN/9T7cE3NbQVKVmijF0X8wiGlrTqMpVIDzbbQcqX
         ydd6XIxXgzrOsnbL32whn9eqUcTa4Y0C4IYwOqqM2ZLciATFDeFZPjrKyM4vEwNZyUXN
         wZVZ4GP5BaG4l7BHyrhZrl3NMthIikm4BbwSIGBmEZIMO5yOY2n4rvxCKnAdt+XqAdkN
         cNsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx2gql+wE26sy8nWkA8CWhev44z8f/rZnASOeiQseC7ZKQxGwm+b+OYSzQZrwmiIV22FCD/T0D/dWVSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwV/an+QlT4WKtvQSm/tAy6Gre+8RH6Wx549+R5hSqc5jmPZfDy
	Or5r+ACEO0P4gIiQJlRkxPBvIZaIz9091ZHUjF4V4fTz4Ws0fyiWFWPGPGIyG9XTTfv8GFgcaIs
	0cyZtQ/9fsrDHdynhh8Aktsg0xo8UY+w=
X-Gm-Gg: ATEYQzw2axhy1rDlBz35Id71CTKe2n3TGEBOoXFXg+n5QY/MiLviwWi5QouJQO/qutd
	0KEjCHtt2LtjAAFaOsHv0kzLnywkRL9/fHRQl21ninJ54HSOXmaXbKBdCR9q5eUHqXCTKk9VpnU
	TQeLlrBRrGVkFhnViPRueCvaA54Bg/5acKQ6EubOmbF+Jy4S1Qf24VmoVMnkWbiTl8lMLmPDf37
	zNK9idF7FPQgIiaX3NzrR4PuCUsjH9FrACqrgzMN/CxOCtYfo2hFs7FlEZm7rV6D4pWDVMDqaIL
	1xOK69nyVIOwARhTHCiVD1vKOCUjJ6SYcm5VbLZwFQ==
X-Received: by 2002:a17:906:5994:b0:b94:1771:5296 with SMTP id
 a640c23a62f3a-b982f27d258mr722760466b.23.1774338810639; Tue, 24 Mar 2026
 00:53:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOdxtTadAFH01Vui1FvWfcmQ8jH1O45owTzUcpYbNvBxnLeM7Q@mail.gmail.com>
In-Reply-To: <CAOdxtTadAFH01Vui1FvWfcmQ8jH1O45owTzUcpYbNvBxnLeM7Q@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 24 Mar 2026 08:53:19 +0100
X-Gm-Features: AQROBzDDpxDWrnI_0ErHKf9B-NvnkFzklWGTuiS7-g7t4QluNxFJT4EpViODXMc
Message-ID: <CAOQ4uxjuAfCJXGRchDf-7d+uCS+8=Du_Y8OzgX15w4-fOR_oHQ@mail.gmail.com>
Subject: Re: [REGRESSION] fs/overlayfs/ext4: Severe jbd2 lock contention and
 journal starvation on concurrent copy-up (v6.6 -> v6.12)
To: Chenglong Tang <chenglongtang@google.com>
Cc: linux-unionfs@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, jack@suse.com, Jan Kara <jack@suse.cz>, 
	miklos@szeredi.hu, tytso@mit.edu, adilger.kernel@dilger.ca, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, Kevin Berry <kpberry@google.com>, 
	Robert Kolchmeyer <rkolchmeyer@google.com>, Deepa Dinamani <deepadinamani@google.com>, 
	He Gao <hegao@google.com>, Fei Lv <feilv@asrmicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 11:03=E2=80=AFPM Chenglong Tang
<chenglongtang@google.com> wrote:
>
> Hi all,

Hi Chenglong,

>
> We are tracking a severe performance regression in Google's
> Container-Optimized OS (COS) that appeared when moving from the 6.6
> LTS kernel to the 6.12 LTS kernel.
>
> Under concurrent CI workloads (specifically, many containers doing
> Python package compilation / .pyc generation simultaneously), the 6.12
> kernel suffers from massive jbd2 journal contention. Processes hang
> for 20-30 seconds waiting for VFS locks and journal space. On 6.6, the
> exact same workload completes in ~4 seconds.
>
> # Environment:
> * Host FS: ext4 (backed by standard cloud block storage)
> * Container FS: OverlayFS (Docker)
> * Machine: n2d-highmem-96 (96 vCPU, high memory)
> * Good Kernel: 6.6.87
> * Bad Kernels: 6.12.55, 6.12.68
>
> # The Bottleneck
> During the 20+ second hang, `cat /proc/<pid>/stack` reveals three
> distinct groups of blocked processes thrashing on the jbd2 journal.
> The OverlayFS copy-up mechanism seems to be generating so many
> synchronous ext4 transactions that it exhausts the jbd2 transaction
> buffers.
>
> 1. Journal Space Exhaustion (Waiting to start transaction):
> [<0>] __jbd2_log_wait_for_space+0xa3/0x240
> [<0>] start_this_handle+0x42d/0x8a0
> [<0>] jbd2__journal_start+0x103/0x1e0
> [<0>] __ext4_journal_start_sb+0x129/0x1c0
> [<0>] __ext4_new_inode+0x7cd/0x1290
> [<0>] ext4_create+0xbc/0x1b0
> [<0>] vfs_create+0x192/0x250
> [<0>] ovl_create_real+0xd5/0x170
> [<0>] ovl_create_or_link+0x1d7/0x7f0
>
> 2. VFS Rename / Copy-up Contention (Blocked by the slow sync):
> [<0>] lock_rename+0x29/0x50
> [<0>] ovl_copy_up_flags+0x84c/0x12e0
> [<0>] ovl_create_object+0x4a/0x120
> [<0>] vfs_mkdir+0x1aa/0x260
> [<0>] do_mkdirat+0xb9/0x240
>
> 3. Synchronous Flush Blocking:
> [<0>] jbd2_log_wait_commit+0x107/0x150
> [<0>] jbd2_journal_force_commit+0x9c/0xc0
> [<0>] ext4_sync_file+0x278/0x310
> [<0>] ovl_sync_file+0x2f/0x50
> [<0>] ovl_copy_up_metadata+0x455/0x4b0
>
> # Minimal Reproducer
> The issue is easily reproducible by triggering 20 concurrent cold
> Python imports in Docker, which forces OverlayFS to copy-up the
> `__pycache__` directories and write the `.pyc` files.
>
> ```bash
> # 1. Build a clean image with no pre-compiled bytecode
> cat << 'EOF' > Dockerfile
> FROM python:3.10-slim
> RUN pip install --quiet google-cloud-compute
> RUN find /usr/local -type d -name "__pycache__" -exec rm -rf {} +
> EOF
> docker build -t clean-import-test .
>
> # 2. Fire 20 concurrent imports
> for i in {1..20}; do
>   docker run --rm clean-import-test bash -c 'time python -c "import
> google.cloud.compute_v1"' > clean_test_cold_$i.log 2>&1 &
> done
> wait
> grep "real" clean_test_cold_*.log
> ```

I don't understand.

You write that Python imports in Docker forces OverlayFS to copy-up the
`__pycache__` directories, but the prep stage removes all the
`__pycache__` directories.

My guess would be that rm -rf __pycache__ would generate a lot of
metadata copy ups, but you write that the issue occurs during the
2nd stage. Maybe I misunderstood.

Please try to figure out which and how many copy up objects this translates=
 to
for directories, for files?

>
> On 6.6.87, all 20 containers finish in ~4.3s.
> On 6.12.x, they hang and finish between 17s and 27s. Bypassing disk
> writes completely mitigates the regression on 6.12 (using
> PYTHONDONTWRITEBYTECODE=3D1), confirming it is an ext4/overlayfs I/O
> contention issue rather than a CPU scheduling one.
>
> Because the regression spans from 6.6 to 6.12, bisection is quite
> heavy. Before we initiate a full kernel bisect, does this symptom ring
> a bell for any ext4 fast_commit, jbd2 locking, or OverlayFS
> metacopy/sync changes introduced during this window?
>
> Any pointers or patches you'd like us to test would be greatly appreciate=
d.
>

Very high suspect:

7d6899fb69d25 ovl: fsync after metadata copy-up

As you can see from this discussion [1] this performance regression
was somewhat anticipated:

"Now we just need to hope that users won't come shouting about
performance regressions."

[1] https://lore.kernel.org/linux-unionfs/CAOQ4uxgKC1SgjMWre=3DfUb00v8rxtd6=
sQi-S+dxR8oDzAuiGu8g@mail.gmail.com/

With metacopy disabled this change introduced fsyncs on metadata-only
changes made my overlayfs which could generate a lot of journal stress
and explain the regression.

But we had not anticipated that workloads could be affected with
metacopy disabled, because it was anticipated that data fsync
would be the more significant bottleneck.

Do your containers have metacopy enabled?
If not, why not? Is it because metacopy is conflicting with some
other overlayfs feature that you need like userxattr?

Thinking out loud, I wonder if metadata copy up code would benefit from
calling export_ops->commit_metadata() when supported by upper fs
instead of open+vfs_fsync(), but I doubt if that would relieve journal stre=
ss
in this case.

Anyway, please see if forcing metadata_fsync off solves the regression
and I will stage the original patch from Fei to make metadata_fsync
opt-in.

Thanks,
Amir.

--- a/fs/overlayfs/copy_up.c
+++ b/fs/overlayfs/copy_up.c
@@ -1154,7 +1154,7 @@ static int ovl_copy_up_one(struct dentry
*parent, struct dentry *dentry,
         * that will hurt performance of workloads such as chown -R, so we
         * only fsync on data copyup as legacy behavior.
         */
-       ctx.metadata_fsync =3D !OVL_FS(dentry->d_sb)->config.metacopy &&
+       ctx.metadata_fsync =3D 0 && !OVL_FS(dentry->d_sb)->config.metacopy =
&&
                             (S_ISREG(ctx.stat.mode) || S_ISDIR(ctx.stat.mo=
de));
        ctx.metacopy =3D ovl_need_meta_copy_up(dentry, ctx.stat.mode, flags=
);
