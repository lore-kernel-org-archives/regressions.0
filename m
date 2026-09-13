Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0708C36998A
	for <regressions@lists.linux.dev>; Sun, 13 Sep 2026 16:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789316279; cv=pass; b=n+YVrCHE+WTgKxL1xZTMrgovoXlZiTL4cRYY8OWM4lIl+DCZw3VIOVHl1ZnJ1twR+mnTC79/Y0bCXfqtYexWuFtAdv9nFdfSqhMNT4XecFjZfoKFhanzfgpSSTeX/7A/oKDKqTkrONUlsu8Ey7+Z8weRpF5nzL10+ytJDisIEco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789316279; c=relaxed/simple;
	bh=qrjaa3A/zSN3z/kTwF5pNuuhb8WEmUsn7IuE9lN2/WE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DnK2rV6vZxvis5jsjb2oJCh0kVs4fwmc/M3Wwk/0//xmUr5m/+hJu0uILZjmVEQeo4DXuCIDbBBXiQ6DHYkQfhqUvi+CnnGT2yvYFFmCq4/dUuqjhF2ZUOUIOPvooT5o5CKLMokjB4pUbauSLlddH8Fdp2q4CW7WHMzGRtF6lEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=biKHytqZ; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="biKHytqZ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b5e50eb70so26655e9.1
        for <regressions@lists.linux.dev>; Sun, 13 Sep 2026 09:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789316273; cv=none;
        d=google.com; s=arc-20260327;
        b=o3zLZHTobpaSNrh4XKfKm6bsCrXKdfHHIH9BC4OXQSDfWo6FS449jDBDTpKVN34z0w
         R9c94RqHJZFuuW+0zJRk088u1VgTwdeh24Fl15aKW9yAchhLCN598qKU9em9Xvhb9xzU
         DvIZrIQWGSf0M11SR2eV3Xp5JSy1ii1JlZt7A4Pw5QA0u5VV92HJ750BX+x7F/a0RpBh
         QXVkinON+au1+Hrx/IE2fJPA32cpo2pq2qFfksWz/3BB5X6HjkZvKQX3acvMDfcQkcRE
         9cEewXHIhNpIDR7PLSkVfrjekBIBGtXplPVdG673bxKnKLMY4gm53pVPCBLGHX8JAWGP
         LQ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yt+Ej+RFTyAlxOsRS7i/kggIDyE3eMtCY51oxHgQhKU=;
        fh=fw+LZW/ltlEc/PoWsXjsV37BaSh4aFjwoId9TrowY4M=;
        b=b/wSKZHW3GqaK9AnkcVE41U2JoA43A/AgYNjhF6KE+45vfjOAgD+fF4bJKV6rsdv0C
         Vm6K8M8BRuWvuHcmcbI8VMWzV3NI17T6c54UkGcH0iK5+c11jzRb5jB55P4GDjhHL3RC
         YI8inAAA6Kuxta74VL+aZkTbhdrxLadFhJ7vNm4WRnHMd0Pi2yJbDfug3RVXwv1qt1FR
         774GkjPNZc8DY34RxpiO2jKpPRl7Wm8hCstCoBW9pl0iapVmO1WDKTT+TGDCgPrA0eMR
         NjrdY140KIHYorxP7uqDPsH+ySl8xs4tTz2UXvOihH4UjwoO7cHU5y4ITM0E9p3TS7F3
         7Czg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789316273; x=1789921073; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yt+Ej+RFTyAlxOsRS7i/kggIDyE3eMtCY51oxHgQhKU=;
        b=biKHytqZjB+esaY1+mT9jeC63olO28Z/cOzdhc/4rAkrXqMnhryRPlPYqiWRQNMBjQ
         MynGTP+pcY0r/CqJ+Gt4sxhfp/4unG9vF4bwYjwDzzLvshttcAT7NmQMaFA3Jq92YIr2
         Gg7wOD8hh1t0E6WRBWnRCYh8FS0WcQqy2an0rbYRjh+Dx/VRJZ/oLsy40FGul9ACUBq6
         +3DQX/E4kSXlbIdN+zibDUpVfxsCbfj8KVnmQPC566bWDvw9xkQQ5kHl+GpioFe2Bwqn
         XasR/dcmB71rvUo+kC8dHupavmJlhKWG/xJx4VPnVZDN160PcyDHSpyDPc9juanVqJbO
         4pFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789316273; x=1789921073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yt+Ej+RFTyAlxOsRS7i/kggIDyE3eMtCY51oxHgQhKU=;
        b=UnCc8C975Wn7AElhYGax/utdAxaePku8ILBMy3iZlk7gTMBtPnxhqU4Tvt5H4lvciY
         RLKtM4p3abvKutHIMsatsM5v8qLHrLPdCMkma8fQVVtfx/wwdiRzSU1ubegA70cbroXX
         ne3mZVNjm/GPF0vO3y8SNpAKjfXbX9d6jU7LT/JXGuvzQIQ3t524Ko+t5YcW9BhImwqa
         1b1SX6ZR7kl79kA6sY72PYeg9EEq1ygJJu/bN638IwPPWVNVMl0oKmmz5K/oBA4TpdyE
         tzZ4kQmjSH+CM2su3eBhwwdbjQb5GCp3cdjfxWCIXdVUdzSfzULqYz9bPqbjsmE+UnN4
         Dvww==
X-Forwarded-Encrypted: i=1; AKwUvBw55Qdkj+Tae/2U2nL9rhq8tOk3hvWG61jTEzaDG2jGrONoqii9UL9Zny102Zpgr7meNSa/pvLiZVYAFA==@lists.linux.dev
X-Gm-Message-State: AFuF++nd5urbmX2N2oRXsPa4K2X4VowpprVQvkWOJHSrxrsa2jyxYOTe
	Cr7XgZpfuiWnRDBmf+bseFsL8NbT5WD/kc1NUYyqA1Co4QQzRAUfTl4J23ZqxE1C4VU2cIlpA3T
	9FHHDpNA68QCyLfi6W/S2NvL3cFaQs1r52FubsvLe
X-Gm-Gg: AYBFou3mfw9n31xWI9bnC89iHW2G6mAeWDQLDgI6KmoCzO2Snys/TD6eTuLWu1tMCBs
	JONOgZa1CV3InDyz+ll3dIJEuWgY8VzDrr75nlW9UL3Dg+PgBFFYfYYhboBamkhtMK9Cgb++OS1
	52OKTB8ZoSuzv6U9jNZ+soMx8eRqGnPFyfw15P4BMRT8X5jEz8wbLvdEP9P9hEsAHoCojtXAdfe
	EKR+vjMfz5i+0Rd6XqpVhITt7ZAnfRq1hvE+V0OzVqwwWTR3cEOerFoQ6Dlr1iFk+f0PUfv1sfH
	Jeen+1naZ8k1ev3SW1fvm4SCY0xTe54z1UGUF74Cps6LMar1woVcOKYz44ZGbiUM5WN7+ARHUIZ
	XtrxqOGHVig==
X-Received: by 2002:a05:600c:3593:b0:49a:d4d9:e417 with SMTP id
 5b1f17b1804b1-49e754445b3mr671735e9.6.1789316272535; Sun, 13 Sep 2026
 09:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANGjgdn=H50AaA-+O_GA-hkE9UwLANmkjx1zRsKUzxF5za8VfQ@mail.gmail.com>
 <aqa7KgIJYGgf7INk@slm.duckdns.org> <CANGjgd=f9n7zEZS=xi71y_dY6Uk75_qgP9qVDkYBusNz9sp2sg@mail.gmail.com>
In-Reply-To: <CANGjgd=f9n7zEZS=xi71y_dY6Uk75_qgP9qVDkYBusNz9sp2sg@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Sun, 13 Sep 2026 09:17:40 -0700
X-Gm-Features: AcwNN1UGrvqbq3HFY7pcrIOl_jX8tfzTKZIUJ5QTX30rH2G51YS_Yo5JvuNEb8Q
Message-ID: <CABdmKX2Oer9wrxWdR8s48Czro8H51HY+S_mfnUj-RvhjCM1RgA@mail.gmail.com>
Subject: Re: [REGRESSION] kernfs: empty cgroup rmdir latency after
 delete-notification changes
To: Chengfeng Lin <lin2530632123@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.cz>, 
	driver-core@lists.linux.dev, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 8:47=E2=80=AFAM Chengfeng Lin <lin2530632123@gmail.=
com> wrote:
>
> Hi Tejun,
>
> Thanks. I found this during research into kernel performance regressions,
> using a microbenchmark of cgroup creation and removal. This was not
> prompted by a production issue.
>
> I reported it to document the added removal cost and ask whether some
> of it could be reduced while preserving the fixes. I agree that the
> roughly 3 us increase per removal does not, by itself, demonstrate a
> significant impact on real workloads.
>
> Thanks,
> Chengfeng
>
> Tejun Heo <tj@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8813=E6=97=A5=E5=
=91=A8=E6=97=A5 23:03=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Hello,
> >
> > On Sun, Sep 13, 2026 at 10:43:04PM +0800, Chengfeng Lin wrote:
> > > I found an increase in empty cgroup removal latency across 507d8ce13f=
5b
> > > ("kernfs: Don't set_nlink for directories being removed") and eea5d2b=
b34ba
> > > ("kernfs: Send IN_DELETE_SELF and IN_IGNORED"). With sched_ext disabl=
ed,
> > > rmdir() went from about 6.5 us to 9.6 us, an increase of 46-47%.
> > > The result held in two independent runs.
> >
> > I don't want to make cgroup removal unnecessarily expensive but at the =
same
> > time it's not an operation that I consider to be a hot path, so as long=
 as
> > the operaiton can finish in a reasonable amount of time and single digi=
t us
> > definitely is, performance of rmdir usually isn't something which is hi=
gh in
> > priority. Can you please detail why this matters for you?
> >
> > Thanks.
> >
> > --
> > tejun

Hi Chengfeng and Tejun,

We use this kernfs IN_DELETE_SELF feature on Android where multiple
cgroups are created and removed frequently on a per-application basis,
but we hadn't noticed a significant delay due to the inotify
functionality during cgroup removal. It's probably masked by much
larger delays (milliseconds) we regularly see due to unreleated issues
with cgroup locks like priority inversion with cgroup_mutex, and
contention for cgroup_threadgroup_rwsem.

As far as what we can do, I think avoiding inode lookups for kernfs
nodes that never had an inode created should improve the situation. It
doesn't eliminate the locking overhead, which I don't think can easily
be eliminated. The code below doesn't deal with inode eviction either,
but at least files which are never accessed won't introduce the inode
lookup overhead.

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 4f9ade82b08a..3ec9f79b1aa2 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -1523,6 +1523,9 @@ static void kernfs_clear_inode_nlink(struct
kernfs_node *kn)
        struct kernfs_root *root =3D kernfs_root(kn);
        struct kernfs_super_info *info;

+       if (!(kn->flags & KERNFS_INODE_INITED))
+               return;
+
        lockdep_assert_held_read(&root->kernfs_supers_rwsem);

        list_for_each_entry(info, &root->supers, node) {
diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
index 38b28aa7cd02..f8b4a8b8ade4 100644
--- a/fs/kernfs/inode.c
+++ b/fs/kernfs/inode.c
@@ -208,6 +208,10 @@ static void kernfs_init_inode(struct kernfs_node
*kn, struct inode *inode)
        set_default_inode_attr(inode, kn->mode);
        kernfs_refresh_inode(kn, inode);

+       down_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
+       kn->flags |=3D KERNFS_INODE_INITED;
+       up_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
+
        /* initialize inode according to type */
        switch (kernfs_type(kn)) {
        case KERNFS_DIR:
diff --git a/include/linux/kernfs.h b/include/linux/kernfs.h
index e21b2f7f4159..87f074ce19d3 100644
--- a/include/linux/kernfs.h
+++ b/include/linux/kernfs.h
@@ -113,6 +113,7 @@ enum kernfs_node_flag {
        KERNFS_EMPTY_DIR        =3D 0x1000,
        KERNFS_HAS_RELEASE      =3D 0x2000,
        KERNFS_REMOVING         =3D 0x4000,
+       KERNFS_INODE_INITED     =3D 0x8000,
 };

-T.J.
