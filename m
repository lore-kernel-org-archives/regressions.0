Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7181B1FCD
	for <regressions@lists.linux.dev>; Thu, 21 Apr 2022 16:47:44 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id k29so5106085pgm.12
        for <regressions@lists.linux.dev>; Thu, 21 Apr 2022 09:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZZTjvHZCe7fz2iM0dCm7xDiOZP2+Yg+RhUYKbP1pg4E=;
        b=CN4DkTx+fy+8Q+qy9vSRiJeXfx+O2qRG1oRmJqlsu9zGzoTUSbB0RQwJgysQQqyZ8R
         jYV5N7pXW/POmjVp+1UKc15BsxS2W8WgJ5mY98vzyjoZXFnc9h1nF6ThDP9+PlN0Q0yG
         HXpRJUuHslXrFgfwaRyZgsmYGc5wB7rDf5s+GhiJCM30snDRKdTyaX86fGqbGWheBhNz
         ngwW8J1NQ02VFoPhzXsf/V+z1N2k3YLZadRrEQG7dP238XPw3Gx3hrLSbkEqme1wuK8L
         pre2Zgbw0qsExNK0aTLJS3CK9pO15JoTrevab+jhSbfmvwRgdavWMq2wmwzySsJV1v8O
         wWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=ZZTjvHZCe7fz2iM0dCm7xDiOZP2+Yg+RhUYKbP1pg4E=;
        b=F07sk2HxCQfhFXD6Egei62iZiom5vtigHqnW5LLUe3DIhUGtBjRUHcCMuj1Kqc676x
         4E1qDQKqFbXI4IiZXfmWMnpBEZ759tEeCH6OMGFdWg8rrzb9UIg7ikVVnCKvsWJaEuUs
         CAomLPEqbICJGE5yOUgALN5rMHygCC1WD7cxbAsYqj88ApD9U49vuqERGm07KLyngrXU
         HrepqsyxBkyYAtZwdv0+iKLMk7Fe4Wu69glkOOVLeK1dGm/zpcGshJnBQ3iE4uX9mRNH
         GDZ+1z9WvGreqpddMcLrA4W+kWZiJ9cudeQP3AZvcSiPMzcpO6PfpbdmPXJ6RCNQgfDs
         HOzw==
X-Gm-Message-State: AOAM53383DlwT4K6XZIx6Q8IYy6LjyFpOZAdUtJ2LUhidta+l5O/m7dm
	BRyySWkL+3ap/OdcDIgwHL0=
X-Google-Smtp-Source: ABdhPJywmqzKE3HIUf0XcpsoUvzsg5+8lr42t3hrKnqAmpk/nqk27W39Vkq+BeuIkB/O68hotdh71g==
X-Received: by 2002:a05:6a00:1988:b0:4fa:c15d:190d with SMTP id d8-20020a056a00198800b004fac15d190dmr533212pfl.44.1650559663644;
        Thu, 21 Apr 2022 09:47:43 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:2c86])
        by smtp.gmail.com with ESMTPSA id d20-20020a056a00199400b005060849909esm28105085pfl.176.2022.04.21.09.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 09:47:42 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Thu, 21 Apr 2022 06:47:41 -1000
From: Tejun Heo <tj@kernel.org>
To: Jirka Hladky <jhladky@redhat.com>
Cc: Minchan Kim <minchan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Justin Forbes <jforbes@fedoraproject.org>
Subject: Re: PANIC: "Oops: 0000 [#1] PREEMPT SMP PTI" starting from 5.17 on
 dual socket Intel Xeon Gold servers
Message-ID: <YmGKrd1BR9HSEy6q@slm.duckdns.org>
References: <536eca11-b4b9-c1a8-6e6b-fcd0c339a3ec@leemhuis.info>
 <CAE4VaGBZk2NL6Tn2fGxmGMR-n8KFNqgPOktY_sQ1vjViLDNhhg@mail.gmail.com>
 <CAE4VaGB4=aCd8iDb4EduR+-5QTSgVWd5sxrnBA4e3g9dPrnuBg@mail.gmail.com>
 <YkTxox8ZQIDtojfU@google.com>
 <CAFxkdAq6r2WnwML-pPfdZiajaYZCEcUU3GrXW=+wsA7CxGnJdQ@mail.gmail.com>
 <CAE4VaGBchOMWeHQ8GKiGFv_aCaNGLEvSdLWXZTpE+qC=0bgM3A@mail.gmail.com>
 <YkY6W1NS+1RTw0VB@google.com>
 <CAE4VaGDAMZqjwumyvbityzEiK30=5a5vuDMjaS+UHM39R-oPRw@mail.gmail.com>
 <YkstxbC3OfzYnSRw@google.com>
 <CAE4VaGAQZcQzN8D+iwcBnP5vY=Ctmbh+oTikvONHir6JjTgpsw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE4VaGAQZcQzN8D+iwcBnP5vY=Ctmbh+oTikvONHir6JjTgpsw@mail.gmail.com>

Sorry about late reply.

On Wed, Apr 20, 2022 at 10:02:20AM +0200, Jirka Hladky wrote:
> > Based on your report, kernel was crashed due to kn_mondata was NULL
> >
> >   rdt_kill_sb
> >     rmdir_all_sub
> >       ..
> >       kernfs_remove(kn_mondata);
> >         struct kernfs_root *root = kernfs_root(kn); <-- crashed
> >
> >
> > Before the my patch[1], it worked like this.
> >
> >   rdt_kill_sb
> >     rmdir_all_sub
> >       ..
> >       kernfs_remove(kn_mondata);
> >         down_write(&kernfs_rwsem);
> >           if (!kn)
> >             return;
> >         up_write(&kernfs_rwsem);
> >
> > IOW, before, kernfs_remove worked with NULL argument via just bailing
> > but with the my patch[1], it doesn't work any longer.
> >
> > It makes me have questions for kernfs maintainers:
> >
> > Should kernfs_remove API support NULL parameter? If so, can we support
> > it atomically without old global kernfs_rwsem?
> >
> > [1] 393c3714081a, kernfs: switch global kernfs_rwsem lock to per-fs lock

Yes, I mean, kernfs_remove() used to support NULL arg, so it should do the
same after the locking change too. Can you send a patch?

Thanks.

-- 
tejun
