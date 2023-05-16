Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19D234CD7
	for <regressions@lists.linux.dev>; Tue, 16 May 2023 17:07:41 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52]:50950)
	by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1pyx2l-0025sd-8t; Tue, 16 May 2023 09:56:55 -0600
Received: from ip68-110-29-46.om.om.cox.net ([68.110.29.46]:40674 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1pyx2j-006GOt-S4; Tue, 16 May 2023 09:56:54 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Christie <michael.christie@oracle.com>,  Oleg Nesterov
 <oleg@redhat.com>,  Christian Brauner <brauner@kernel.org>,  Thorsten
 Leemhuis <linux@leemhuis.info>,  nicolas.dichtel@6wind.com,  Linux kernel
 regressions list <regressions@lists.linux.dev>,  hch@infradead.org,
  stefanha@redhat.com,  jasowang@redhat.com,  mst@redhat.com,
  sgarzare@redhat.com,  virtualization@lists.linux-foundation.org,
  konrad.wilk@oracle.com,  linux-kernel@vger.kernel.org,  Jens Axboe
 <axboe@kernel.dk>
References: <20230202232517.8695-1-michael.christie@oracle.com>
	<20230202232517.8695-9-michael.christie@oracle.com>
	<aba6cca4-e66c-768f-375c-b38c8ba5e8a8@6wind.com>
	<CAHk-=wgadfsCnKHLON7op=Qs5t3w3PVz5ZDbvbKsfb=yBg=yjQ@mail.gmail.com>
	<78c5e150-26cf-7724-74ee-4a0b16b944b1@oracle.com>
	<48842e92-835e-bc3f-7118-48b8f415f532@leemhuis.info>
	<CAHk-=wicXCNR1bBioaAiBqEDgv-CoQD9z2RsM2VOTPzkK0xr8g@mail.gmail.com>
	<20230515-vollrausch-liebgeworden-2765f3ca3540@brauner>
	<CAHk-=wgXJ5VS1iBkfsG=HDjsyhn5XYDKt5xhQcNuz-e7VKyg8A@mail.gmail.com>
	<122b597e-a5fa-daf7-27bb-6f04fa98d496@oracle.com>
	<CAHk-=wgTpRDwS+F0Gd6+bM+TEh+x4Aiz8EBDTnTm3Q4TFdWOww@mail.gmail.com>
Date: Tue, 16 May 2023 10:56:45 -0500
In-Reply-To: <CAHk-=wgTpRDwS+F0Gd6+bM+TEh+x4Aiz8EBDTnTm3Q4TFdWOww@mail.gmail.com>
	(Linus Torvalds's message of "Mon, 15 May 2023 15:54:49 -0700")
Message-ID: <87cz30s20y.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-XM-SPF: eid=1pyx2j-006GOt-S4;;;mid=<87cz30s20y.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=68.110.29.46;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX1/VfBwRPfud8jr0vc2IuGNU4bzbZFMEkfc=
X-SA-Exim-Connect-IP: 68.110.29.46
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa01.xmission.com
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=8.0 tests=ALL_TRUSTED,BAYES_50,
	DCC_CHECK_NEGATIVE,T_SCC_BODY_TEXT_LINE,T_TM2_M_HEADER_IN_MSG,
	T_TooManySym_01,XMSubLong,XM_B_Unicode shortcircuit=no
	autolearn=disabled version=3.4.2
X-Spam-Virus: No
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5000]
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	*  0.0 XM_B_Unicode BODY: Testing for specific types of unicode
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa01 1397; Body=1 Fuz1=1 Fuz2=1]
	* -0.0 T_SCC_BODY_TEXT_LINE No description available.
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa01 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Linus Torvalds <torvalds@linux-foundation.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 836 ms - load_scoreonly_sql: 0.03 (0.0%),
	signal_user_changed: 4.6 (0.5%), b_tie_ro: 3.1 (0.4%), parse: 0.79
	(0.1%), extract_message_metadata: 9 (1.1%), get_uri_detail_list: 1.73
	(0.2%), tests_pri_-2000: 3.9 (0.5%), tests_pri_-1000: 2.2 (0.3%),
	tests_pri_-950: 1.05 (0.1%), tests_pri_-900: 0.85 (0.1%),
	tests_pri_-200: 0.69 (0.1%), tests_pri_-100: 3.8 (0.5%),
	tests_pri_-90: 152 (18.2%), check_bayes: 141 (16.9%), b_tokenize: 7
	(0.9%), b_tok_get_all: 10 (1.2%), b_comp_prob: 2.2 (0.3%),
	b_tok_touch_all: 117 (14.0%), b_finish: 0.86 (0.1%), tests_pri_0: 329
	(39.4%), check_dkim_signature: 0.70 (0.1%), check_dkim_adsp: 3.8
	(0.5%), poll_dns_idle: 313 (37.4%), tests_pri_10: 1.80 (0.2%),
	tests_pri_500: 322 (38.5%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v11 8/8] vhost: use vhost_tasks for worker threads
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Mon, May 15, 2023 at 3:23=E2=80=AFPM Mike Christie
> <michael.christie@oracle.com> wrote:
>>
>> The vhost layer really doesn't want any signals and wants to work like k=
threads
>> for that case. To make it really simple can we do something like this wh=
ere it
>> separates user and io worker behavior where the major diff is how they h=
andle
>> signals and exit. I also included a fix for the freeze case:
>
> I don't love the SIGKILL special case, but I also don't find this
> deeply offensive. So if this is what it takes, I'm ok with it.
>
> I wonder if we could make that special case simply check for "is
> SIGKILL blocked" instead? No normal case will cause that, and it means
> that a PF_USER_WORKER thread could decide per-thread what it wants to
> do wrt SIGKILL.

A kernel thread can block SIGKILL and that is supported.

For a thread that is part of a process you can't block SIGKILL when the
task is part of a user mode process.

There is this bit in complete_signal when SIGKILL is delivered to any
thread in the process.


			/*
			 * Start a group exit and wake everybody up.
			 * This way we don't have other threads
			 * running and doing things after a slower
			 * thread has the fatal signal pending.
			 */
			signal->flags =3D SIGNAL_GROUP_EXIT;
			signal->group_exit_code =3D sig;
			signal->group_stop_count =3D 0;
			t =3D p;
			do {
				task_clear_jobctl_pending(t, JOBCTL_PENDING_MASK);
				sigaddset(&t->pending.signal, SIGKILL);
				signal_wake_up(t, 1);
			} while_each_thread(p, t);

For clarity that sigaddset(&t->pending.signal, SIGKILL);  Really isn't
setting SIGKILL pending, it is part of the short circuit delivery logic,
and that sigaddset(SIGKILL) is just setting a flag to tell the process
it needs to die.


The important part of that code is that SIGNAL_GROUP_EXIT gets set.
That indicates the entire process is being torn down.

Where this becomes important is exit_notify and release_task work
together to ensure that the first thread in the process (a user space
thread that can not block SIGKILL) will not send SIGCHLD to it's parent
process until every thread in the process has exited.

The delay_group_leader logic in wait_consider_task part of wait(2) has
the same logic.

Having been through this with io_uring the threads really need to call
get_signal to handle that case.


This is pretty much why I said at the outset you they needed to decided
if they were going to implement a thread or if they were going to be a
process.  Changing the decision to be a thread from a process is fine
but in that case the vhost logic needs to act like a process, just
like io_uring does.


> Christian? And I guess we should Cc: Oleg too, since the signal parts
> are an area he's familiar with and has worked on.. Eric Biederman has
> already been on the list and has also been involved

>
> Oleg: see
>
>   https://lore.kernel.org/lkml/122b597e-a5fa-daf7-27bb-6f04fa98d496@oracl=
e.com/
>
> for the context here.

Eric

