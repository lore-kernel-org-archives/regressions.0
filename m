Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D09B30648B
	for <regressions@lists.linux.dev>; Thu, 25 Sep 2025 16:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758819527; cv=none; b=K4TZ4DidzlTlziGFJnNZjxPMEKQ5o7Ito4Ov7yDXhx2FJRt9m/bbWzBQcA8GrDTQdFjlUcvo3A9OjpPmQszXIjAohP9Hgg39/1xni2h/B9Ja/fI3R+U6QoVeM9uplZa4uKPZXpmBkTkrh2IjXnTUENQZmmVzFeva/lDr412vVXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758819527; c=relaxed/simple;
	bh=OYPt7rOi6P5t7UUoGeJ0cu65gDoDgf43KCnZmOl/mnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SLzzeQlQGSfNLgfKsCZe3hkBPtF0trD46Th6ZBoF+4pXiIraxuFyuoL7RTEzEhmPwWWZebcDIt7wn8TCbfLfgXXYKhmOtOiiH6R+gkK5ipFrhOOUn0EpzJTNTXRQqW/7mGO4G8uH7RJyoio8lxG3F8mM4VtrMEZT5qKdVTfplb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cBtb4m+N; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cBtb4m+N"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57bf9bb803dso200e87.1
        for <regressions@lists.linux.dev>; Thu, 25 Sep 2025 09:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758819523; x=1759424323; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yq6K8HIdEhD+E9swYwDQPb1XoskrFD+rIaFeN3MEj6U=;
        b=cBtb4m+NghOu2nB73H/yvXtPIgGUtqCeEM7YmHgnKnTln4/Ihv//SvBveyETowdhAg
         WYt3g2vaEA1CYFiebXxuWY66fWxOrSHFYEeJFoA3rTxieM+SYkvc+Ffk4R2ZMYdrSKO6
         Fjf+hptRFJOvuZVWyww5CbeowGatJI0A4k53bSwme7/lvE3k9u1ul6EVUV5VG6y/h6c4
         76ChNVL0QyNrAj/H6jUIZ0so9ESbCiLtSq5yNwcxJSh7IISy+VNHJFt060TRsRwj0KWT
         1jo2HW1W/ezKkBNvWSu88b2ZXfhH+2cCWnYvDXdESXAgTXobhIwfPHp1yth0bU9tMQd+
         u4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758819523; x=1759424323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yq6K8HIdEhD+E9swYwDQPb1XoskrFD+rIaFeN3MEj6U=;
        b=wR9nDwDVfTS+cHLty5U2jh3MEXHuY+QuqYBjjJWCM/aYAD09xITG2i8yXywgEfQpZd
         Yk70cEegUamMKLev68flqq/RRW0k8qzPSFEruj/kqNQSfPkYg0tOAf0rYeFiWn2UXjPX
         M9f9CJ7vqA2KpK75KJGjLMGocYkV5Y9APGrYr1kFbh5ntKDlPy1Czef8YWdwiqZJcoju
         FrBsHoE4jGN7hrHIy4NMeAdFg5UrI2cP8PH03hNfvPQbiXNNN37XptEoDKGbY5wXec5/
         zQM4irHbBd8pHBfggRvOGjlx876DTgQlkqnH3fp21KVUJ7qzu1NWH+YXhp5u7WGZ5xrt
         fvjg==
X-Forwarded-Encrypted: i=1; AJvYcCVWAcXq9zQkgBBxzXUnCwfvojgu2TwKBFjM26fwMfum2cVL5sppqmV93hxmh18XXl8TVl/tJ1CqHyRCEQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxoNpx9ipSBbeJlp5gBS1w9UFQSKDXx1dPgmoj6x5htZ6JGVr18
	SUgXOKGTZMagTNATVQVMhEvnTIf7GxYSGZtw+hQSrsIAfgBQcmtPZMgR1e+eyQ/C8Ck6xwYF5eU
	ocOYKtkTD2ugd0WkQYYc2xHy36axETX0PxGurAHBY
X-Gm-Gg: ASbGncuFGdj0HU9OZBNL11s20XgQk6NCuyaPDpFjP+KvjAS7d3jwskWumZxcTTo7ko8
	w1zXsbJGjZHS3Fmb7nx7IcCnxH+tDNhPzwsksh+djOEWiFOPL+//lloV0K7Hn7n7kEV7et4p51F
	W75TwibHh+iezbh/NxL0PXmB9VD32FND+rn9t/Uk7lKVcSeBdWC7UsxCgz7cZUMmcFHwTBzRcnS
	dwUiMMXaLqSVfQlQ4VXRlki
X-Google-Smtp-Source: AGHT+IGJxwQPsa1HBrOtLrDgPHg2NyLPfDxj76oZhDbyhTXsObrV+BiQuT52NKznoNST7PhF7zcIbJIyyNp5aMzCq1I=
X-Received: by 2002:ac2:5b81:0:b0:57b:f611:f918 with SMTP id
 2adb3069b0e04-582b2a9560fmr321110e87.3.1758819523044; Thu, 25 Sep 2025
 09:58:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOdxtTZJqgDNMtqsq51hQ0azanFPLXHMAJ-mRhRS6yjzYhMf_A@mail.gmail.com>
 <aNSSNgUeMSTtlimW@slm.duckdns.org>
In-Reply-To: <aNSSNgUeMSTtlimW@slm.duckdns.org>
From: Chenglong Tang <chenglongtang@google.com>
Date: Thu, 25 Sep 2025 09:58:31 -0700
X-Gm-Features: AS18NWBXIryw_12tNJ7Zcnq0SWl772-SIFkfVkMUoyR0eC464fAlVAG0qvqtTdI
Message-ID: <CAOdxtTan9jvwzbww0Jm6e4nOiCcwH8cvPHHXpNtRU6ZHUBg=4g@mail.gmail.com>
Subject: Re: [REGRESSION] workqueue/writeback: Severe CPU hang due to kworker
 proliferation during I/O flush and cgroup cleanup
To: Tejun Heo <tj@kernel.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, lakitu-dev@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Confirmed the patches worked for the mainline(6.17-rc7). But it's
still flaky(1/13) if I simply apply the patches to v6.12.46.

I think there should be some gap commits that I should apply as well.

Here is the diff between the two kernel versions after patches are applied:

diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index fad8ddfa622bb..62d85c5086ba1 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -65,7 +65,7 @@ struct wb_writeback_work {
* timestamps written to disk after 12 hours, but in the worst case a
* few inodes might not their timestamps updated for 24 hours.
*/
-static unsigned int dirtytime_expire_interval =3D 12 * 60 * 60;
+unsigned int dirtytime_expire_interval =3D 12 * 60 * 60;
static inline struct inode *wb_inode(struct list_head *head)
{
@@ -290,6 +290,7 @@ void __inode_attach_wb(struct inode *inode, struct
folio *folio)
if (unlikely(cmpxchg(&inode->i_wb, NULL, wb)))
wb_put(wb);
}
+EXPORT_SYMBOL_GPL(__inode_attach_wb);
/**
* inode_cgwb_move_to_attached - put the inode onto wb->b_attached list
@@ -770,9 +771,8 @@ bool cleanup_offline_cgwb(struct bdi_writeback *wb)
* writeback completion, wbc_detach_inode() should be called. This is used
* to track the cgroup writeback context.
*/
-static void wbc_attach_and_unlock_inode(struct writeback_control *wbc,
- struct inode *inode)
- __releases(&inode->i_lock)
+void wbc_attach_and_unlock_inode(struct writeback_control *wbc,
+ struct inode *inode)
{
if (!inode_cgwb_enabled(inode)) {
spin_unlock(&inode->i_lock);
@@ -802,24 +802,7 @@ static void wbc_attach_and_unlock_inode(struct
writeback_control *wbc,
if (unlikely(wb_dying(wbc->wb) && !css_is_dying(wbc->wb->memcg_css)))
inode_switch_wbs(inode, wbc->wb_id);
}
-
-/**
- * wbc_attach_fdatawrite_inode - associate wbc and inode for fdatawrite
- * @wbc: writeback_control of interest
- * @inode: target inode
- *
- * This function is to be used by __filemap_fdatawrite_range(), which is a=
n
- * alternative entry point into writeback code, and first ensures @inode i=
s
- * associated with a bdi_writeback and attaches it to @wbc.
- */
-void wbc_attach_fdatawrite_inode(struct writeback_control *wbc,
- struct inode *inode)
-{
- spin_lock(&inode->i_lock);
- inode_attach_wb(inode, NULL);
- wbc_attach_and_unlock_inode(wbc, inode);
-}
-EXPORT_SYMBOL_GPL(wbc_attach_fdatawrite_inode);
+EXPORT_SYMBOL_GPL(wbc_attach_and_unlock_inode);
/**
* wbc_detach_inode - disassociate wbc from inode and perform foreign detect=
ion
@@ -1282,13 +1265,6 @@ static void bdi_split_work_to_wbs(struct
backing_dev_info *bdi,
}
}
-static inline void wbc_attach_and_unlock_inode(struct writeback_control *w=
bc,
- struct inode *inode)
- __releases(&inode->i_lock)
-{
- spin_unlock(&inode->i_lock);
-}
-
#endif /* CONFIG_CGROUP_WRITEBACK */
/*
@@ -2475,7 +2451,14 @@ static void wakeup_dirtytime_writeback(struct
work_struct *w)
schedule_delayed_work(&dirtytime_work, dirtytime_expire_interval * HZ);
}
-static int dirtytime_interval_handler(const struct ctl_table *table, int w=
rite,
+static int __init start_dirtytime_writeback(void)
+{
+ schedule_delayed_work(&dirtytime_work, dirtytime_expire_interval * HZ);
+ return 0;
+}
+__initcall(start_dirtytime_writeback);
+
+int dirtytime_interval_handler(const struct ctl_table *table, int write,
void *buffer, size_t *lenp, loff_t *ppos)
{
int ret;
@@ -2486,25 +2469,6 @@ static int dirtytime_interval_handler(const
struct ctl_table *table, int write,
return ret;
}
-static const struct ctl_table vm_fs_writeback_table[] =3D {
- {
- .procname =3D "dirtytime_expire_seconds",
- .data =3D &dirtytime_expire_interval,
- .maxlen =3D sizeof(dirtytime_expire_interval),
- .mode =3D 0644,
- .proc_handler =3D dirtytime_interval_handler,
- .extra1 =3D SYSCTL_ZERO,
- },
-};
-
-static int __init start_dirtytime_writeback(void)
-{
- schedule_delayed_work(&dirtytime_work, dirtytime_expire_interval * HZ);
- register_sysctl_init("vm", vm_fs_writeback_table);
- return 0;
-}
-__initcall(start_dirtytime_writeback);
-
/**
* __mark_inode_dirty - internal function to mark an inode dirty
*

On Wed, Sep 24, 2025 at 5:52=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> On Wed, Sep 24, 2025 at 05:24:15PM -0700, Chenglong Tang wrote:
> > The kernel v6.1 is good. The hang is reliably triggered(over 80% chance=
) on
> > kernels v6.6 and 6.12 and intermittently on mainline(6.17-rc7) with the
> > following steps:
> > -
> >
> > *Environment:* A machine with a fast SSD and a high core count (e.g.,
> > Google Cloud's N2-standard-128).
> > -
> >
> > *Workload:* Concurrently generate a large number of files (e.g., 2 mill=
ion)
> > using multiple services managed by systemd-run. This creates significan=
t
> > I/O and cgroup churn.
> > -
> >
> > *Trigger:* After the file generation completes, terminate the systemd-r=
un
> > services.
> > -
> >
> > *Result:* Shortly after the services are killed, the system's CPU load
> > spikes, leading to a massive number of kworker/+inode_switch_wbs thread=
s
> > and a system-wide hang/livelock where the machine becomes unresponsive =
(20s
> > - 300s).
>
> Sounds like:
>
>  http://lkml.kernel.org/r/20250912103522.2935-1-jack@suse.cz
>
> Can you see whether those patches resolve the problem?
>
> Thanks.
>
> --
> tejun
