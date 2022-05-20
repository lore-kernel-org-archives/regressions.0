Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F562F4A
	for <regressions@lists.linux.dev>; Fri, 20 May 2022 17:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=mYBo9IPynpe0pl+mZeNGkr1lS3oG/UutDNomBlexN9o=;
	t=1653068364; x=1654277964; b=oP8TImOLPdcUKCe0+E0gjqnIqy0gkTSe23eb3ntMrYJJD55
	OQnZaR310QAZIBFv96v34z/ZwvYfp1ANcnjaSEajQ/4dYNJ+O48Hu0QAsd+/wILdYKQcu11gTVro7
	yipTRvoLptQKZIWGrqyMVkMs0PgOyiiHvrKN+mEYj9IP2B55eKYADwOisJlITLedOyuzjUps4Qgia
	yDUQU8tvnPtWyfLhVHZ3MAG2HqkSS86SmNCh4JMlHMpp8gIUWHNvULejSWXis202SWQvLVDAusruU
	T1iHALiPL+fL+0W1u4CqmxsYbcmRQ54W95Rft4i2UQ35QZQli/niyyAM1t6O4XSg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	(envelope-from <johannes@sipsolutions.net>)
	id 1ns6Gk-00HR5C-0z;
	Fri, 20 May 2022 19:18:30 +0200
Message-ID: <32824a71109fe3387d582abbf56601fb08bdc9ef.camel@sipsolutions.net>
Subject: Re: [PATCH 1/1] um: fix error return code in winch_tramp()
From: Johannes Berg <johannes@sipsolutions.net>
To: Nathan Chancellor <nathan@kernel.org>, Thorsten Leemhuis
	 <regressions@leemhuis.info>
Cc: Richard Weinberger <richard@nod.at>, Zhen Lei
 <thunder.leizhen@huawei.com>,  Jeff Dike <jdike@addtoit.com>, anton ivanov
 <anton.ivanov@cambridgegreys.com>, Andrew Morton
 <akpm@linux-foundation.org>, Eduard-Gabriel Munteanu <maxdamage@aladin.ro>,
  linux-um <linux-um@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 regressions <regressions@lists.linux.dev>
Date: Fri, 20 May 2022 19:18:28 +0200
In-Reply-To: <Yoe5/HwL9DXhaw7Z@dev-arch.thelio-3990X>
References: <20210508032239.2177-1-thunder.leizhen@huawei.com>
	 <Yjt31seiNv18HYrf@dev-arch.thelio-3990X>
	 <1b03d888-cea3-3e6f-087f-daeb5642a975@leemhuis.info>
	 <1087614384.239493.1649583213699.JavaMail.zimbra@nod.at>
	 <YlRp9KR1mp3/4Txo@thelio-3990X>
	 <1287561645.244713.1649702724736.JavaMail.zimbra@nod.at>
	 <e9597cbc-cabb-facf-deb6-662d40cf16a3@leemhuis.info>
	 <Yoe5/HwL9DXhaw7Z@dev-arch.thelio-3990X>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Fri, 2022-05-20 at 08:55 -0700, Nathan Chancellor wrote:
> On Fri, May 20, 2022 at 08:08:01AM +0200, Thorsten Leemhuis wrote:
> > On 11.04.22 20:45, Richard Weinberger wrote:
> > > ----- Urspr=C3=BCngliche Mail -----
> > > > Von: "Nathan Chancellor" <nathan@kernel.org>
> > > > I attempted to print out the error code but it seems like there is =
no
> > > > output in the console after "reboot: System halted". If I add an
> > > > unconditional print right before the call to os_set_fd_block(), I s=
ee it
> > > > during start up but I do not see it during shutdown. Is there some =
way
> > > > to see that console output during shutdown?
> > >=20
> > > I think in this case the easiest way is attaching gdb with a breakpoi=
nt.
> >=20
> > I noticed this in my list of open regressions. It seems there wasn't an=
y
> > progress to get this regression fixed (please let me know in case I
> > missed something), but I guess nobody considered it urgent which is
> > likely not that much of a problem in this case.
>=20
> Yes, sorry, I tried to get gdb to reveal something but I couldn't get it
> to work then I had to move onto other work. We have worked around this
> for the time being but it would still be nice to figure out what is
> going on here; I am just not sure when I am going to have time to
> participate in that process.
>=20

This fixes it for me, can you check it?

diff --git a/arch/um/drivers/chan_user.c b/arch/um/drivers/chan_user.c
index 6040817c036f..25727ed648b7 100644
--- a/arch/um/drivers/chan_user.c
+++ b/arch/um/drivers/chan_user.c
@@ -220,7 +220,7 @@ static int winch_tramp(int fd, struct tty_port *port, i=
nt *fd_out,
 		       unsigned long *stack_out)
 {
 	struct winch_data data;
-	int fds[2], n, err;
+	int fds[2], n, err, pid;
 	char c;
=20
 	err =3D os_pipe(fds, 1, 1);
@@ -238,8 +238,9 @@ static int winch_tramp(int fd, struct tty_port *port, i=
nt *fd_out,
 	 * problem with /dev/net/tun, which if held open by this
 	 * thread, prevents the TUN/TAP device from being reused.
 	 */
-	err =3D run_helper_thread(winch_thread, &data, CLONE_FILES, stack_out);
-	if (err < 0) {
+	pid =3D run_helper_thread(winch_thread, &data, CLONE_FILES, stack_out);
+	if (pid < 0) {
+		err =3D pid;
 		printk(UM_KERN_ERR "fork of winch_thread failed - errno =3D %d\n",
 		       -err);
 		goto out_close;
@@ -263,7 +264,7 @@ static int winch_tramp(int fd, struct tty_port *port, i=
nt *fd_out,
 		goto out_close;
 	}
=20
-	return err;
+	return pid;
=20
  out_close:
 	close(fds[1]);


Kind of obvious, really. :)

johannes
