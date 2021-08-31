Received: from mo1.intermailgate.com (mo1.intermailgate.com [91.203.103.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF3B3FC3
	for <regressions@lists.linux.dev>; Tue, 31 Aug 2021 14:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mo1.intermailgate.com (Postfix) with ESMTP id 508FC2049B
	for <regressions@lists.linux.dev>; Tue, 31 Aug 2021 16:57:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bof.de; s=20180522;
	t=1630421855; bh=IoAwKcdc+q/wFfv5qGzkpzYehGURggWZDTsRW19a1ms=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dKX+NKpPFZ0786tzFHVMlwddXLJ0UHqmnFvHO8quzDuxKGCuGKtYB7n5uJxqIP/Ar
	 gvUr17pywQHVYwh/LP6qU3lb2FfvTi3x6b4kk81O7rMgWF/vMC8aqjjEJKlrOsQ3S8
	 nGnrgFD2IQHdSvP1NDz6b0puMwyQYHMiZRGkHYhU=
Received: from mail-lf1-f52.google.com (unknown [162.158.183.106])
	by mo1.intermailgate.com (Postfix) with ESMTPSA id DD21F2020F
	for <regressions@lists.linux.dev>; Tue, 31 Aug 2021 16:57:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bof.de; s=20180522;
	t=1630421850; bh=IoAwKcdc+q/wFfv5qGzkpzYehGURggWZDTsRW19a1ms=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O/3OFpfUdLTDQZo7kdU0nFQJq5FnR+kHfO3ZCUwJdhDKV8mGoy5RamVVRgSKcCVDk
	 t4eM5f5m4eU4c6XqonDNOEucEgw2cR4FULXDFzXxt92IDVyHfy+4R41umARJpbQ0ho
	 7Xnsx6gZdathxQyFUEd9FO+o2l6hvTm+pUxdeXCc=
Received: by mail-lf1-f52.google.com with SMTP id m28so8916744lfj.6
        for <regressions@lists.linux.dev>; Tue, 31 Aug 2021 07:57:30 -0700 (PDT)
X-Gm-Message-State: AOAM530Iw78xXF0IsJJm+YRrEUjx3/sVxMmhts0qT288UBJ3Mfkbr7hf
	2Q/D6RhrI9Yi0ggc64/BjxHxsXlHh96l0J2YHOM=
X-Google-Smtp-Source: ABdhPJzENr5JXWULNinTi3u+QPQZOQJwjUSuwLFFO075tQRFyz9Vz7UY71ii/lziTPtQpDeeCVrN8vvuDT590Ke2Ir8=
X-Received: by 2002:a05:6512:1686:: with SMTP id bu6mr22144338lfb.168.1630421849263;
 Tue, 31 Aug 2021 07:57:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <61018d93.xsvXcO161PFLQFCX%bof@bof.de> <YQGXyiMb1IntqacG@kroah.com>
 <CAJ26g5S2tbDhRbWkcgRzAu0eX=FNk00P8srboOSn=jYp4saALA@mail.gmail.com> <YS3TpF8B5TA2mGFr@hirez.programming.kicks-ass.net>
In-Reply-To: <YS3TpF8B5TA2mGFr@hirez.programming.kicks-ass.net>
From: Patrick Schaaf <bof@bof.de>
Date: Tue, 31 Aug 2021 16:57:11 +0200
X-Gmail-Original-Message-ID: <CAJ26g5Toxq-WaRFvP9V-dNL0GXx+w5PTakcQw2stW1HteUhS3w@mail.gmail.com>
Message-ID: <CAJ26g5Toxq-WaRFvP9V-dNL0GXx+w5PTakcQw2stW1HteUhS3w@mail.gmail.com>
Subject: Re: stable 5.4.135 REGRESSION / once-a-day WARNING: at kthread_is_per_cpu+0x1c/0x20
To: Peter Zijlstra <peterz@infradead.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	=?UTF-8?B?SWdvciBMb27EjWFyZXZpxIc=?= <anubis@igorloncarevic.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 31, 2021 at 9:01 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> 3a7956e25e1d ("kthread: Fix PF_KTHREAD vs to_kthread() race") munged
> into 5.4.135
>
> Never even seen a compiler, please tests.

Thanks a lot, Peter. With the addition of a little semicolon in one
place, I successfully built 5.4.143 with the patch applied, in both my
host and vm configs.

I now have two machines with identical workloads (webserver, database)
running, one with unpatched 5.4.143, the other with 5.4.143 and that
patch. Expectation is to see the WARNING on the former, but not on the
latter. Will report in a day or three about the outcome.

regards
  Patrick

Tested-By: Patrick Schaaf <bof@bof.de>

diff --git a/kernel/kthread.c b/kernel/kthread.c
index b2bac5d929d2..22750a8af83e 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -76,6 +76,25 @@ static inline struct kthread *to_kthread(struct
task_struct *k)
        return (__force void *)k->set_child_tid;
 }

+/*
+ * Variant of to_kthread() that doesn't assume @p is a kthread.
+ *
+ * Per construction; when:
+ *
+ *   (p->flags & PF_KTHREAD) && p->set_child_tid
+ *
+ * the task is both a kthread and struct kthread is persistent. However
+ * PF_KTHREAD on it's own is not, kernel_thread() can exec() (See umh.c and
+ * begin_new_exec()).
+ */
+static inline struct kthread *__to_kthread(struct task_struct *p)
+{
+       void *kthread = (__force void *)p->set_child_tid;
+       if (kthread && !(p->flags & PF_KTHREAD))
+               kthread = NULL;
+       return kthread;
+}
+
 void free_kthread_struct(struct task_struct *k)
 {
        struct kthread *kthread;
@@ -176,10 +195,11 @@ void *kthread_data(struct task_struct *task)
  */
 void *kthread_probe_data(struct task_struct *task)
 {
-       struct kthread *kthread = to_kthread(task);
+       struct kthread *kthread = __to_kthread(task);
        void *data = NULL;

-       probe_kernel_read(&data, &kthread->data, sizeof(data));
+       if (kthread)
+               probe_kernel_read(&data, &kthread->data, sizeof(data));
        return data;
 }

@@ -490,9 +510,9 @@ void kthread_set_per_cpu(struct task_struct *k, int cpu)
        set_bit(KTHREAD_IS_PER_CPU, &kthread->flags);
 }

-bool kthread_is_per_cpu(struct task_struct *k)
+bool kthread_is_per_cpu(struct task_struct *p)
 {
-       struct kthread *kthread = to_kthread(k);
+       struct kthread *kthread = __to_kthread(p);
        if (!kthread)
                return false;

@@ -1272,11 +1292,9 @@ EXPORT_SYMBOL(kthread_destroy_worker);
  */
 void kthread_associate_blkcg(struct cgroup_subsys_state *css)
 {
-       struct kthread *kthread;
+       struct kthread *kthread = __to_kthread(current);
+

-       if (!(current->flags & PF_KTHREAD))
-               return;
-       kthread = to_kthread(current);
        if (!kthread)
                return;

@@ -1298,13 +1316,10 @@ EXPORT_SYMBOL(kthread_associate_blkcg);
  */
 struct cgroup_subsys_state *kthread_blkcg(void)
 {
-       struct kthread *kthread;
+       struct kthread *kthread = __to_kthread(current);

-       if (current->flags & PF_KTHREAD) {
-               kthread = to_kthread(current);
-               if (kthread)
-                       return kthread->blkcg_css;
-       }
+       if (kthread)
+               return kthread->blkcg_css;
        return NULL;
 }
 EXPORT_SYMBOL(kthread_blkcg);
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 74cb20f32f72..87d9fad9d01d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7301,7 +7301,7 @@ int can_migrate_task(struct task_struct *p,
struct lb_env *env)
                return 0;

        /* Disregard pcpu kthreads; they are where they need to be. */
-       if ((p->flags & PF_KTHREAD) && kthread_is_per_cpu(p))
+       if (kthread_is_per_cpu(p))
                return 0;

        if (!cpumask_test_cpu(env->dst_cpu, p->cpus_ptr)) {
