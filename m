Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3CB811
	for <regressions@lists.linux.dev>; Tue, 29 Nov 2022 11:38:26 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ozywR-0001gv-O2; Tue, 29 Nov 2022 12:38:23 +0100
Message-ID: <22ea8381-1292-6b8c-873b-309195b54595@leemhuis.info>
Date: Tue, 29 Nov 2022 12:38:23 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: RFC: considering adding a predefined statement to newly filed kernel
 bugs in bugzilla.kernel.org
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 "workflows@vger.kernel.org" <workflows@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1669721907;5670a070;
X-HE-SMSGID: 1ozywR-0001gv-O2

Hi Konstantin!

The bugzilla.kernel.org situation still bugs me, as I every few days see
a report or two that at least from a quick look seems valid and good,
but nevertheless is ignored (for a recent example see
https://bugzilla.kernel.org/show_bug.cgi?id=216736 ). I can't help each
of them individually. Hence as a stopgap measure I'm considering adding
a comment with a predefined statement to any reasonable Linux kernel bug
report I notice (I look at most of them anyway to check for regressions,
so quickly adding a comment is not that much trouble for me).

Find the proposed text for the predefined statement below. It's supposed
to link to a page on the web with even more details; the proposed text
for that is below, too.

Is it okay for you if I start doing this? Are the texts okay from your
perspective, too? I tried to be careful with my wording, but maybe I
didn't find the right tone in some places or forgot something important.

I'm asking as I don't want to undermine your efforts at all, I just want
to enable users to help themselves *now* until your efforts to improve
the situation are in place.

Ciao, Thorsten

################# propose statement to be used as comment

Many thanks for your report. There is something important you might not
be aware of(¹): some, many, or most kernel bug reports submitted here
will never reach suitable developers. You hence might not get any
replies from them here. If that’s the outcome after roundabout a week,
resubmit your report to the place where the developers of the subsystem
in question expect reports; the document
https://docs.kernel.org/admin-guide/reporting-issues.html explains how
to find that place in the section "Check where you need to report your
issue". Please add a comment here when you go down that route.

There are plans to improve things over the next few months, as explained
here: <fixme: link to the page in the web with below text>; that page
also provides a few additional details why things happen to be as
briefly outlined above.

(¹) Please don't shoot the messenger, I’m quite unhappy about this state
of things myself. But they are outside of my control. And I think it’s
better to tell you about the situation now, as you otherwise might be
waiting weeks or months for a reaction here that might be pretty
unlikely to happen in the first place.


################# text for a webpage

# On the state of bugzilla kernel

## TLDR

Some, many, or most bug reports submitted in bugzilla.kernel.org will
never reach suitable kernel developers. If you don’t receive a reply
from them, you might want to re-submit your report to the place where
developers actually expect bug reports. There are plans to improve this
situation – a situation which came into being due to various unfortunate
developments a long time ago.

## What this is about

An unknown quantity of bug reports submitted to bugzilla.kernel.org will
never reach kernel developers that take care of the code that might
cause the particular issue. That’s among the reasons why some, many, or
most of those reports never get a reply. This page will explain what you
can do in that case, what is planned to improve the situation, and how
this state of things came to be.

### What can I do if my report in bugzilla.kernel.org is ignored

If your bug report in bugzilla.kernel.org within a week receives no
replies at all or none from developers working on the code in question,
consider re-submitting your report to the place where those developers
expect reports; how to find that place is explained by the document
“Reporting issues”
(https://docs.kernel.org/admin-guide/reporting-issues.html) in the
section “Check where you need to report your issue”. Please add a
comment to your report in bugzilla when you go down this route.

Side note: you might also want to read and follow the “Reporting issues”
document as a whole, as that will avoid many other pitfalls that might
lead to your bug report being ignored. Quite a few or many kernel
developers for example only handle reports about issues with the latest
mainline codebase or the latest stable release; reports about issues in
longterm (aka LTS) kernels or any version more than two weeks old thus
might not be acted upon. The same fate often happens to reports about
issues with distro kernels, as most of them are heavily modified or
enhanced, which might cause the issue you face; that’s also why
reporting issues with kernels that use any drivers not build straight
from the Linux kernel sources (like those from Nvidia) are often ignored
and thus a waste of time.

### What is planned to improve the situation

Konstantin Ryabitsev plans to realize his proposal from early October
2022:
https://lore.kernel.org/lkml/20221004175354.bfvg3vhfqch35ib5@meerkat.local/


For the backstory on how that proposal came into being, see the
following text and the sources it links to: https://lwn.net/Articles/910740/

### Why are developers free to ignoring bug reports in bugzilla.kernel.org

Because participation has always been and still is optional for the
developers of the Linux kernel. That's because well-intended people a
long time ago thought Linux kernel development would benefit from having
a bugtracker and set up bugzilla.kernel.org; they did that despite the
fact that many core Linux developer's beforehand had made it clear they
didn't like or even opposed the idea -- and thus were unwilling to
participate.

Many components and products bugzilla.kernel.org lists for the Linux
kernel thus not even initially had developers on board that looked at
newly submitted bugs. The idea was to have volunteers for these areas
that checked the reports and forwarded the good ones to the actual
kernel developers – but that never really worked out for real on a large
scale. Many after some time also left without any successors. This is
why some bug reports are never forwarded to suitable kernel developers.

The people who set up and cared about the bug tracker over time moved on
to other endeavors. But by then the bugtacker could not simply be
decommissioned, as a tiny number of kernel developers and the subsystems
they maintained had started relying on it for internal development. In
the end as of this writing in 2022 around 20 out of 1500 maintainers and
subsystems listed in the kernel's MAINTAINERS file officially committed
to handle bug filled in bugzilla.kernel.org (mainly those from the areas
of ACPI, Power Management, and PCI). A few other subsystems and an
unknown number of individual developers keep a close or loose eye on it
as well; there are also some that participate when pointed to reports
about their code. But in the end some or many kernel developers don’t
care about it at all and never receive copies of bugs occurring in the
they maintain.
