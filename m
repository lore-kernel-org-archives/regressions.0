Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77BC34CD9
	for <regressions@lists.linux.dev>; Tue, 16 May 2023 13:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684244427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XmVZa6rWHxSlUUKvwO4ykn0iGDBDGTKqwvGiklVx1pE=;
	b=E87Pii9aDAyLFgl4TvWSOFHNq+xE3wUoBlTtDYs9umAdhRPqFm1/VP1pXs+ZbdD08DkHeD
	K5gQ2WCFhxUVjODvjYtGJxen38g3iCyBJR5afRCKDbtQ0tDmNkOCceJX/oqLNtJj1Zvr41
	opOJ69XRGl8wm8xIhqA3yCEnb2ieDLM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-dIddS3M_Mu2_jKYn5PS7Nw-1; Tue, 16 May 2023 09:40:24 -0400
X-MC-Unique: dIddS3M_Mu2_jKYn5PS7Nw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76AC680B2BB;
	Tue, 16 May 2023 13:40:22 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.147])
	by smtp.corp.redhat.com (Postfix) with SMTP id D57D82166B31;
	Tue, 16 May 2023 13:40:17 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 16 May 2023 15:40:08 +0200 (CEST)
Date: Tue, 16 May 2023 15:40:03 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>, nicolas.dichtel@6wind.com,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	hch@infradead.org, stefanha@redhat.com, jasowang@redhat.com,
	mst@redhat.com, sgarzare@redhat.com,
	virtualization@lists.linux-foundation.org, ebiederm@xmission.com,
	konrad.wilk@oracle.com, linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v11 8/8] vhost: use vhost_tasks for worker threads
Message-ID: <20230516134002.GB28890@redhat.com>
References: <aba6cca4-e66c-768f-375c-b38c8ba5e8a8@6wind.com>
 <CAHk-=wgadfsCnKHLON7op=Qs5t3w3PVz5ZDbvbKsfb=yBg=yjQ@mail.gmail.com>
 <78c5e150-26cf-7724-74ee-4a0b16b944b1@oracle.com>
 <48842e92-835e-bc3f-7118-48b8f415f532@leemhuis.info>
 <CAHk-=wicXCNR1bBioaAiBqEDgv-CoQD9z2RsM2VOTPzkK0xr8g@mail.gmail.com>
 <20230515-vollrausch-liebgeworden-2765f3ca3540@brauner>
 <CAHk-=wgXJ5VS1iBkfsG=HDjsyhn5XYDKt5xhQcNuz-e7VKyg8A@mail.gmail.com>
 <122b597e-a5fa-daf7-27bb-6f04fa98d496@oracle.com>
 <CAHk-=wgTpRDwS+F0Gd6+bM+TEh+x4Aiz8EBDTnTm3Q4TFdWOww@mail.gmail.com>
 <8bfb7d1d-f7d0-94ca-4777-e31a2003027a@oracle.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bfb7d1d-f7d0-94ca-4777-e31a2003027a@oracle.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

On 05/15, Mike Christie wrote:
>
> --- a/kernel/vhost_task.c
> +++ b/kernel/vhost_task.c
> @@ -75,13 +75,13 @@ struct vhost_task *vhost_task_create(int (*fn)(void *), void *arg,
>  				     const char *name)
>  {
>  	struct kernel_clone_args args = {
> -		.flags		= CLONE_FS | CLONE_UNTRACED | CLONE_VM,
> +		.flags		= CLONE_FS | CLONE_UNTRACED | CLONE_VM |
> +				  CLONE_THREAD | CLONE_SIGHAND,

I am looking at 6/8 on https://lore.kernel.org/lkml/ ...

with this change kernel_wait4() in vhost_task_stop() won't work?

Oleg.

