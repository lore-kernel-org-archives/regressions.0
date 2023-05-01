Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A3A3D78
	for <regressions@lists.linux.dev>; Mon,  1 May 2023 17:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6C8C433D2;
	Mon,  1 May 2023 17:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682961322;
	bh=Rnwd3jASwht07ENoOLmN+yQOD6wS2aI12lvNs7J1KiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qt/nwiWlP5Xj3LoPebLaYBd4begRxAvkF+fafNlLBq/yn0x2FClZiwL8v6Vrhy3mm
	 fbarybHIQtkp6pNjeyiw6SwOmWnMhu49MSEq9eEyXR0MvmMQQbwoi4JGwOyrTf4ql6
	 BOtbWGVKN18JEydmlmUSpldN5kzQ2XvhoigQh1SzfusmHUJBoK2Kqd4sikw1JEWB3i
	 A3rZpA0afXkH+OxsX9GQ/nEiH2G0tgf4aAGuZC4kFTapgY8dnx5vpuJRM9nsz0ozBQ
	 FsnuoTtiejqSqmLJkYWWnfTFLvyMhc6kCWadRQuPZeI6BWjGZFk15FxEUD8CElE56Z
	 G1CRz+jl1eeEw==
From: SeongJae Park <sj@kernel.org>
To: Daniel Latypov <dlatypov@google.com>
Cc: SeongJae Park <sj@kernel.org>,
	brendanhiggins@google.com,
	davidgow@google.com,
	rmoar@google.com,
	linux-kernel@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kselftest@vger.kernel.org,
	skhan@linuxfoundation.org,
	johannes@sipsolutions.net,
	Johannes Berg <johannes.berg@intel.com>,
	regressions@lists.linux.dev
Subject: Re: [PATCH v2 1/3] kunit: tool: add subscripts for type annotations where appropriate
Date: Mon,  1 May 2023 17:15:20 +0000
Message-Id: <20230501171520.138753-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAGS_qxqmWYzTBkfmFoALoteaG303tJNh1K5N2=Pmykqk+2BeTg@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Daniel,

On Sun, 30 Apr 2023 14:34:09 -0700 Daniel Latypov <dlatypov@google.com> wrote:

> On Sun, Apr 30, 2023 at 11:15 AM SeongJae Park <sj@kernel.org> wrote:
> >
> > Hi Daniel,
> >
> > On Thu, 16 Mar 2023 15:06:36 -0700 Daniel Latypov <dlatypov@google.com> wrote:
> >
> > > E.g. for subprocess.Popen, it can be opened in `text=True` mode where it
> > > returns strings, or `text=False` where it returns bytes.
> > > To differentiate, you can annotate types as `Popen[str]` or
> > > `Popen[bytes]`.
> > >
> > > This patch should add subscripts in all the places we were missing them.
> >
> > I just found this patch is in the latest mainline tree, and it causes kunit
> > failure on my test machine like below.
> >
> >     $ python3 --version
> >     Python 3.8.10
> >     $
> >     $ ./tools/testing/kunit/kunit.py run --build_dir ../kunit.out/
> >     Traceback (most recent call last):
> >       File "./tools/testing/kunit/kunit.py", line 24, in <module>
> >         import kunit_kernel
> >       File "/home/sjpark/linux/tools/testing/kunit/kunit_kernel.py", line 42, in <module>
> >         class LinuxSourceTreeOperations:
> >       File "/home/sjpark/linux/tools/testing/kunit/kunit_kernel.py", line 95, in LinuxSourceTreeOperations
> >         def start(self, params: List[str], build_dir: str) -> subprocess.Popen[str]:
> >     TypeError: 'type' object is not subscriptable
> >     $
> >
> > I further confirmed reverting this patch makes it run again.  Do you have any
> > idea?
> 
> It seems like support for the subscript wasn't added until Python 3.9.
> 
> I know support for subscripting other types like re.Pattern was added
> in 3.9 per https://peps.python.org/pep-0585/ but it doesn't mention
> Popen there...
> This patch also added typing.IO[str] and concurrent.Future[None], so
> those might be problematic too.
> 
> Can you check if the typing.IO and concurrent.Future[None] changes
> cause problems?
> (I don't have an easy way of testing against older Python versions currently).

Thank you for quick reply.  Reverting Popen changes only as below fixed my
issue.  So seems typing.IO and concurrent.Future[None] chages doesn't cause
problems at least for my use case.

    diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
    index f01f94106129..7f648802caf6 100644
    --- a/tools/testing/kunit/kunit_kernel.py
    +++ b/tools/testing/kunit/kunit_kernel.py
    @@ -92,7 +92,7 @@ class LinuxSourceTreeOperations:
     		if stderr:  # likely only due to build warnings
     			print(stderr.decode())
     
    -	def start(self, params: List[str], build_dir: str) -> subprocess.Popen[str]:
    +	def start(self, params: List[str], build_dir: str) -> subprocess.Popen:
     		raise RuntimeError('not implemented!')
     
     
    @@ -113,7 +113,7 @@ class LinuxSourceTreeOperationsQemu(LinuxSourceTreeOperations):
     		kconfig.merge_in_entries(base_kunitconfig)
     		return kconfig
     
    -	def start(self, params: List[str], build_dir: str) -> subprocess.Popen[str]:
    +	def start(self, params: List[str], build_dir: str) -> subprocess.Popen:
     		kernel_path = os.path.join(build_dir, self._kernel_path)
     		qemu_command = ['qemu-system-' + self._qemu_arch,
     				'-nodefaults',
    @@ -142,7 +142,7 @@ class LinuxSourceTreeOperationsUml(LinuxSourceTreeOperations):
     		kconfig.merge_in_entries(base_kunitconfig)
     		return kconfig
     
    -	def start(self, params: List[str], build_dir: str) -> subprocess.Popen[str]:
    +	def start(self, params: List[str], build_dir: str) -> subprocess.Popen:
     		"""Runs the Linux UML binary. Must be named 'linux'."""
     		linux_bin = os.path.join(build_dir, 'linux')
     		params.extend(['mem=1G', 'console=tty', 'kunit_shutdown=halt'])

> 
> If so, we should revert the patch.
> If not, we can undo just the Popen changes.
> 
> And in either case, we'll need to update ./tools/testing/kunit/run_checks.py.
> Currently, it runs `mypy --strict` which will start failing if we
> revert any part of this patch.

Those make sense.


Thanks,
SJ

> 
> Thanks,
> Daniel
